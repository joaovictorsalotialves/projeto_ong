import { remove } from "../../models/Supplement/remove.js";

export const deleteSupplementController = async (request, response) => {
  let idSupplement = request.params.idSupplement;

  if (isNaN(idSupplement)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let result = await remove(idSupplement);

  return result.status
    ? response.status(200).json({ sucess: true, message: 'Supplement deleted successfully' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to deleted supplement', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
