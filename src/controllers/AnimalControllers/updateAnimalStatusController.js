import { editStatus } from "../../models/Animal/editStatus.js";

export const updateAnimalStatusController = async (request, response) => {
  let idAnimal = request.params.idAnimal;
  let { statusAnimal } = request.body;

  if (isNaN(idAnimal)) return response.status(404).json({ success: false, message: 'Incorrect parameter' });

  if (!statusAnimal) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required field'
    });
  }

  let result = await editStatus(idAnimal, statusAnimal);

  return result.status
    ? response.status(200).json({ success: true, message: 'Animal status updated successfully' })
    : result.error
      ? response.status(500).json({ success: false, message: 'Failed to update animal status', error: result.error })
      : response.status(400).json({ success: false, message: result.message });
}
