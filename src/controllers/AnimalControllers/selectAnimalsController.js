import { findAll } from "../../models/Animal/findAll.js";

export const selectAnimalsController = async (request, response) => {
  let {nameAnimal, statusAnimal, size, idSpecies, idRace} = request.query;

  let animals = await findAll(nameAnimal, statusAnimal, size, idSpecies, idRace);

  return animals.status
    ? response.status(200).json({ success: true, values: animals.values })
    : response.status(500).json({ success: false, message: 'Failed to fetch animals', error: animals.error });
}
