import { remove } from "../../models/SupplementOutput/remove.js";

export const deleteSupplementOutputController = async (request, response) => {
  let idSupplementOutput = request.params.idSupplementOutput;

  if (isNaN(idSupplementOutput)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let result = await remove(idSupplementOutput);

  return result.status
    ? response.status(200).json({ sucess: true, message: 'Supplement Output deleted successfully' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to deleted supplement output', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
