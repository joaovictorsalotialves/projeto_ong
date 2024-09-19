import { edit } from "../../models/Species/edit.js";

export const updateSpeciesController = async (request, response) => {
  let idSpecies = request.params.idSpecies;
  let { nameSpecies } = request.body;
  nameSpecies = nameSpecies.toUpperCase();

  if (isNaN(idSpecies)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  if (!nameSpecies) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  let result = await edit(idSpecies, nameSpecies);

  return result.status
    ? response.status(200).json({ sucess: true, message: 'Species changed successfully' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to changed species', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
