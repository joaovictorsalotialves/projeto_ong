import { create } from "../../models/Supplement/create.js";

export const insertSupplementController = async (request, response) => {
  let { nameSupplement, stock, typeMensure, idSupplementCategory } = request.body;
  nameSupplement = nameSupplement.toUpperCase();

  if (!nameSupplement || !typeMensure || !idSupplementCategory) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  let result = await create(nameSupplement, stock, typeMensure, idSupplementCategory);

  return result.status
    ? response.status(200).json({ sucess: true, id: result.id, message: 'Supplement successfully registered' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to registered supplemet', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
