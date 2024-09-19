import { create } from "../../models/Species/create.js";

export const insertSpeciesController = async (request, response) => {
  let { nameSpecies } = request.body;
  nameSpecies = nameSpecies.toUpperCase();

  if (!nameSpecies) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  let result = await create(nameSpecies);

  return result.status
    ? response.status(200).json({ sucess: true, id: result.id, message: 'Species successfully registered' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to registered species', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
