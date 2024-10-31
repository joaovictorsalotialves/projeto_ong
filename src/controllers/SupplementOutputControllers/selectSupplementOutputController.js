import { findById } from "../../models/SupplementOutput/findById.js";

export const selectSupplementOutputController = async (request, response) => {
  let idSupplementOutput = request.params.idSupplementOutput;

  if (isNaN(idSupplementOutput)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let supplementOutput = await findById(idSupplementOutput);

  return supplementOutput.status
    ? response.status(200).json({ sucess: true, values: [supplementOutput.values] })
    : supplementOutput.status === undefined
      ? response.status(404).json({ sucess: false, message: 'Supplement output not found' })
      : response.status(500).json({ sucess: false, message: 'Failed to fetch supplement output', error: supplementOutput.error });
}
