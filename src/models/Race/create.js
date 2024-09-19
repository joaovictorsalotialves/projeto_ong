import { conn } from "../../data/connection.js";
import { findByName } from "./findByName.js";

export const create = async (nameRace) => {
  let race = await findByName(nameRace);

  if (race.status) {
    return {
      status: false,
      message: 'Bad request: Race already registered'
    };
  }

  try {
    let idRace = await conn.insert({
      nameRace: nameRace
    }).table('races').returning(['idRace']);
    return { status: true, id: idRace[0] };
  } catch (error) {
    return { status: false, error: error };
  }
}
