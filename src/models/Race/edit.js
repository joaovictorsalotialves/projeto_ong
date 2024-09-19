import { conn } from "../../data/connection.js";
import { findById } from "./findById.js";
import { findByName } from "./findByName.js";

export const edit = async (idRace, nameRace) => {
  let race = await findById(idRace);
  let verificationNameRace = await findByName(nameRace);

  if (race.status) {
    if (verificationNameRace.status) {
      if (verificationNameRace.values.idRace != idRace) {
        return {
          status: false,
          message: 'Bad request: Race already registered'
        };
      }
    }

    try {
      await conn.update({
        nameRace: nameRace
      }).where({ idRace: idRace }).table('races');
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
