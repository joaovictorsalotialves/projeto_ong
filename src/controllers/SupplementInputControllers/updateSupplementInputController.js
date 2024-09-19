import { edit } from "../../models/SupplementInput/edit.js";

export const updateSupplementInputController = async (request, response) => {
  let idSupplementInput = request.params.idSupplementInput;
  let { description, amount, idSupplement } = request.body;

  if (isNaN(idSupplementInput)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  if (!amount || !idSupplement) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  let result = await edit(idSupplementInput, description, amount, idSupplement);

  return result.status
    ? response.status(200).json({ sucess: true, message: 'Supplement input changed successfully' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to changed supplement input', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
