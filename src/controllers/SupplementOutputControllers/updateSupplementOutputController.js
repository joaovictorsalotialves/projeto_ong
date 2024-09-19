import { edit } from "../../models/SupplementOutput/edit.js";

export const updateSupplementOutputController = async (request, response) => {
  let idSupplementOutput = request.params.idSupplementOutput;
  let { description, amount, idSupplement } = request.body;

  if (isNaN(idSupplementOutput)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  if (!amount || !idSupplement) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  let result = await edit(idSupplementOutput, description, amount, idSupplement);

  return result.status
    ? response.status(200).json({ sucess: true, message: 'Supplement output changed successfully' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to changed supplement output', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
