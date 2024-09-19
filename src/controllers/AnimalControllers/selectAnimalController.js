import { findById } from "../../models/Animal/findById.js";

export const selectAnimalController = async (request, response) => {
  let idAnimal = request.params.idAnimal;

  if (isNaN(idAnimal)) return response.status(404).json({ success: false, message: 'Incorrect parameter' });

  let animal = await findById(idAnimal);

  return animal.status
    ? response.status(200).json({ success: true, values: animal.values })
    : animal.status === undefined
      ? response.status(404).json({ success: false, message: 'Animal not found' })
      : response.status(500).json({ success: false, message: 'Failed to fetch animal', error: animal.error });
}
