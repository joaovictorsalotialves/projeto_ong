import { findById } from "../../models/SupplementInput/findById.js";

export const selectSupplementInputController = async (request, response) => {
  let idSupplementInput = request.params.idSupplementInput;

  if (isNaN(idSupplementInput)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let supplementInput = await findById(idSupplementInput);

  return supplementInput.status
    ? response.status(200).json({ sucess: true, values: [supplementInput.values] })
    : supplementInput.status === undefined
      ? response.status(404).json({ sucess: false, message: 'Supplement input not found' })
      : response.status(500).json({ sucess: false, message: 'Failed to fetch supplement input', error: supplementInput.error });
}
