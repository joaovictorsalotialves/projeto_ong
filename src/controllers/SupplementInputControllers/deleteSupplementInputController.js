import { remove } from "../../models/SupplementInput/remove.js";

export const deleteSupplementInputController = async (request, response) => {
  let idSupplementInput = request.params.idSupplementInput;

  if (isNaN(idSupplementInput)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let result = await remove(idSupplementInput);

  return result.status
    ? response.status(200).json({ sucess: true, message: 'Supplement Input deleted successfully' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to deleted supplement input', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
