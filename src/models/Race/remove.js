import { conn } from "../../data/connection.js";
import { findById } from "./findById.js";

export const remove = async (idRace) => {
  let race = await findById(idRace);

  if (race.status) {
    try {
      await conn.delete().where({ idRace: idRace }).table('races');
      return { status: true };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Not found race'
  };
}
