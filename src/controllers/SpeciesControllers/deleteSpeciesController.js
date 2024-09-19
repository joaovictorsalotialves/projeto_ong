import { remove } from "../../models/Species/remove.js";

export const deleteSpeciesController = async (request, response) => {
  let idSpecies = request.params.idSpecies;

  if (isNaN(idSpecies)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let result = await remove(idSpecies);

  return result.status
    ? response.status(200).json({ sucess: true, message: 'Species deleted successfully' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to deleted species', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
