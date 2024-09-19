import { conn } from "../../data/connection.js";

export const findById = async (idAnimal) => {
  try {
    let animal = await conn
      .select().from('animals')
      .join('species', 'animals.Species_idSpecies', '=', 'species.idSpecies')
      .join('races', 'animals.Races_idRace', '=', 'races.idRace')
      .where({ idAnimal: idAnimal });

    return animal.length > 0
      ? { status: true, values: animal[0] }
      : { status: undefined };
  } catch (error) {
    return { status: false, error: error };
  }
}
