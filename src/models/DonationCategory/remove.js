import { conn } from "../../data/connection.js";
import { findById } from "./findById.js";

export const remove = async (idDonationCategory) => {
  let donationCategory = await findById(idDonationCategory);

  if (donationCategory.status) {
    try {
      await conn.delete().where({ idDonationCategory: idDonationCategory }).table('donationcategories');
      return { status: true };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Not found donation category'
  };
}
