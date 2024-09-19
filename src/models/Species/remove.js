import { conn } from "../../data/connection.js";
import { findById } from "./findById.js";

export const remove = async (idSpecies) => {
  let species = await findById(idSpecies);

  if (species.status) {
    try {
      await conn.delete().where({ idSpecies: idSpecies }).table('species');
      return { status: true };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Not found species'
  };
}
