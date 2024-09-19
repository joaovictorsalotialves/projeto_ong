import { conn } from "../../data/connection.js";
import { findByName } from "./findByName.js";

export const create = async (nameSpecies) => {
  let species = await findByName(nameSpecies);

  if (species.status) {
    return {
      status: false,
      message: 'Bad request: Species already registered'
    };
  }

  try {
    let idSpecies = await conn.insert({
      nameSpecies: nameSpecies
    }).table('species').returning(['idSpecies']);
    return { status: true, id: idSpecies[0] };
  } catch (error) {
    return { status: false, error: error };
  }
}
