import { create } from "../../models/SupplementOutput/create.js";

export const insertSupplementOutputController = async (request, response) => {
  let { description, amount, idSupplement } = request.body;

  if (!amount || !idSupplement) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  let nowDate = new Date();
  let outputDate = `${nowDate.getUTCFullYear()}-${String(nowDate.getUTCMonth() + 1).padStart(2, '0')}-${String(nowDate.getUTCDate()).padStart(2, '0')}`;

  let result = await create(description, amount, outputDate, idSupplement);

  return result.status
    ? response.status(200).json({ sucess: true, id: result.id, message: 'Supplement output successfully registered' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to registered supplemet output', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
