import { conn } from "../../data/connection.js";
import { findById } from "./findById.js";
import { findByName } from "./findByName.js";

export const edit = async (idSpecies, nameSpecies) => {
  let species = await findById(idSpecies);
  let verificationNameSpecies = await findByName(nameSpecies);

  if (species.status) {
    if (verificationNameSpecies.status) {
      if (verificationNameSpecies.values.idSpecies != idSpecies) return {
        status: false,
        message: 'Bad request: Species already registered'
      };
    }

    try {
      await conn.update({
        nameSpecies: nameSpecies
      }).where({ idSpecies: idSpecies }).table('species');
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
