import { conn } from "../../data/connection.js";
import { findById as RaceFindById } from "../Race/findById.js";
import { findById as SpeciesFindById } from "../Species/findById.js";
import { findById } from "./findById.js";

export const edit = async (idAnimal, nameAnimal, size, statusAnimal, description, idSpecies, idRace) => {
  let animal = await findById(idAnimal);

  if (animal.status) {
    let species = await SpeciesFindById(idSpecies);
    let race = await RaceFindById(idRace);

    if (species.status && race.status) {
      try {
        await conn.update({
          nameAnimal: nameAnimal,
          size: size,
          statusAnimal: statusAnimal,
          description: description,
          Species_idSpecies: idSpecies,
          Races_idRace: idRace
        }).where({ idAnimal: idAnimal }).table('animals');
        return { status: true, id: idAnimal };
      } catch (error) {
        return { status: false, error: error };
      }
    }

    return {
      status: false,
      message: species.status
        ? 'Bad request: Invalid race ID'
        : 'Bad request: Invalid species ID'
    };
  }

  return {
    status: false,
    message: 'Bad request: Not found animal'
  };
}
