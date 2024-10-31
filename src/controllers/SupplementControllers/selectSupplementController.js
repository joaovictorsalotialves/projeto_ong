import { findById } from "../../models/Supplement/findById.js";

export const selectSupplementController = async (request, response) => {
  let idSupplement = request.params.idSupplement;

  if (isNaN(idSupplement)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let supplement = await findById(idSupplement);

  return supplement.status
    ? response.status(200).json({ sucess: true, values: [supplement.values] })
    : supplement.status === undefined
      ? response.status(404).json({ sucess: false, message: 'Supplement not found' })
      : response.status(500).json({ sucess: false, message: 'Failed to fetch supplement', error: supplement.error });
}
