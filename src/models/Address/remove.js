import { conn } from "../../data/connection.js";
import { findById } from "./findById.js";

export const remove = async (idAddress) => {
  let address = await findById(idAddress);

  if (address.status) {
    try {
      await conn.delete().where({ idAddress: idAddress }).table('addresses');
      return { status: true };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Not found address'
  };
}
