import { findAll } from "../../models/SupplementInput/findAll.js";

export const selectSupplementInputsController = async (request, response) => {
  let { nameSupplement, nameSupplementCategory, inputDate } = request.query;

  let supplementInputs = await findAll(nameSupplement, nameSupplementCategory, inputDate);

  return supplementInputs.status
    ? response.status(200).json({ sucess: true, values: supplementInputs.values })
    : response.status(500).json({ sucess: false, messagem: 'Failed to fetch supplement inputs', error: supplementInputs.error });
}
