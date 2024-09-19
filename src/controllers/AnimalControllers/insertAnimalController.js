import { create } from "../../models/Animal/create.js";

export const insertAnimalController = async (request, response) => {
  let { nameAnimal, size, statusAnimal, description, idSpecies, idRace } = request.body;

  if (!nameAnimal || !size || !statusAnimal || !idSpecies || !idRace) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  let result = await create(nameAnimal, size, statusAnimal, description, idSpecies, idRace);

  return result.status
    ? response.status(200).json({ success: true, id: result.id, message: 'Animal successfully registered' })
    : result.error
      ? response.status(500).json({ success: false, message: 'Failed to register animal', error: result.error })
      : response.status(400).json({ success: false, message: result.message });
}
