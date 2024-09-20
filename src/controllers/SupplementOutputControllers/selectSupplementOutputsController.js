import { findAll } from "../../models/SupplementOutput/findAll.js";

export const selectSupplementOutputsController = async (request, response) => {
  let { nameSupplement, nameSupplementCategory, outputDate } = request.query;

  let supplementOutputs = await findAll(nameSupplement, nameSupplementCategory, outputDate);

  return supplementOutputs.status
    ? response.status(200).json({ sucess: true, values: supplementOutputs.values })
    : response.status(500).json({ sucess: false, messagem: 'Failed to fetch supplement outputs', error: supplementOutputs.error });
}
