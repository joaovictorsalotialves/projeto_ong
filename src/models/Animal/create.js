import { conn } from "../../data/connection.js";
import { findById as RaceFindById } from "../Race/findById.js";
import { findById as SpeciesFindById } from "../Species/findById.js";

export const create = async (nameAnimal, size, statusAnimal, description, idSpecies, idRace) => {
  let species = await SpeciesFindById(idSpecies);
  let race = await RaceFindById(idRace);

  if (species.status && race.status) {
    try {
      let idAnimal = await conn.insert({
        nameAnimal: nameAnimal,
        size: size,
        statusAnimal: statusAnimal,
        description: description,
        Species_idSpecies: idSpecies,
        Races_idRace: idRace
      }).table('animals').returning(['idAnimal']);
      return { status: true, id: idAnimal[0] };
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
