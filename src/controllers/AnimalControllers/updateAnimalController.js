import { edit } from "../../models/Animal/edit.js";

export const updateAnimalController = async (request, response) => {
  let idAnimal = request.params.idAnimal;
  let { nameAnimal, size, statusAnimal, description, idSpecies, idRace } = request.body;

  if (isNaN(idAnimal)) return response.status(404).json({ success: false, message: 'Incorrect parameter' });

  if (!nameAnimal || !size || !statusAnimal || !idSpecies || !idRace) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  let result = await edit(idAnimal, nameAnimal, size, statusAnimal, description, idSpecies, idRace);

  return result.status
    ? response.status(200).json({ success: true, message: 'Animal updated successfully' })
    : result.error
      ? response.status(500).json({ success: false, message: 'Failed to update animal', error: result.error })
      : response.status(400).json({ success: false, message: result.message });
}
