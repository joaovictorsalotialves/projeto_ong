import { editStatus } from "../../models/Adoption/editStatus.js";

export const updateAdoptionStatusController = async (request, response) => {
  let idAdoption = request.params.idAdoption;
  let { statusAdoption } = request.body;

  if (isNaN(idAdoption)) return response.status(404).json({ success: false, message: 'Incorrect parameter' });

  if (!statusAdoption) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing statusAdoption'
    });
  }

  let result = await editStatus(idAdoption, statusAdoption);

  return result.status
    ? response.status(200).json({ success: true, message: 'Adoption status updated successfully' })
    : result.error
      ? response.status(500).json({ success: false, message: 'Failed to update adoption status', error: result.error })
      : response.status(400).json({ success: false, message: result.message });
}
