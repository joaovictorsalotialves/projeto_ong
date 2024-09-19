import { edit } from "../../models/Supplement/edit.js";

export const updateSupplementController = async (request, response) => {
  let idSupplement = request.params.idSupplement;
  let { nameSupplement, typeMensure, idSupplementCategory } = request.body;
  nameSupplement = nameSupplement.toUpperCase();

  if (isNaN(idSupplement)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  if (!nameSupplement || !typeMensure || !idSupplementCategory) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  let result = await edit(idSupplement, nameSupplement, typeMensure, idSupplementCategory);

  return result.status
    ? response.status(200).json({ sucess: true, message: 'Supplement changed successfully' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to changed supplement', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
