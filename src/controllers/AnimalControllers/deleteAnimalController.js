import { remove } from "../../models/Animal/remove.js";

export const deleteAnimalController = async (request, response) => {
  let idAnimal = request.params.idAnimal;

  if (isNaN(idAnimal)) return response.status(404).json({ success: false, message: 'Incorrect parameter' });

  let result = await remove(idAnimal);

  return result.status
    ? response.status(200).json({ success: true, message: 'Animal deleted successfully' })
    : result.error
      ? response.status(500).json({ success: false, message: 'Failed to delete animal', error: result.error })
      : response.status(400).json({ success: false, message: result.message });
}
