import { conn } from "../../data/connection.js";
import { remove as SupplementInputRemove } from "../SupplementInput/remove.js";
import { findById } from "./findById.js";

export const remove = async (idDonation) => {
  let donation = await findById(idDonation);

  if (donation.status) {
    try {
      await conn.delete().where({ idDonation: idDonation }).table('donations');
      if (donation.values.idSupplementInput) {
        await SupplementInputRemove(donation.values.idSupplementInput);
      }
      return { status: true };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Not found donation'
  };
}
