import { edit } from "../../models/Adoption/edit.js";

export const updateAdoptionController = async (request, response) => {
  let idAdoption = request.params.idAdoption;
  let { idAnimal, idUser, statusAdoption } = request.body;

  if (isNaN(idAdoption)) return response.status(404).json({ success: false, message: 'Incorrect parameter' });

  if (!idAnimal || !idUser) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  let result = await edit(idAdoption, idAnimal, idUser, statusAdoption);

  return result.status
    ? response.status(200).json({ success: true, message: 'Adoption updated successfully' })
    : result.error
      ? response.status(500).json({ success: false, message: 'Failed to update adoption', error: result.error })
      : response.status(400).json({ success: false, message: result.message });
}
