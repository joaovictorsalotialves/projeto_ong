import { create } from "../../models/Adoption/create.js";

export const insertAdoptionController = async (request, response) => {
  let { idAnimal, idUser, statusAdoption } = request.body;

  if (!idAnimal || !idUser) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  let nowDate = new Date();
  let dateAdoption = `${nowDate.getUTCFullYear()}-${String(nowDate.getUTCMonth() + 1).padStart(2, '0')}-${String(nowDate.getUTCDate()).padStart(2, '0')}`;

  let result = await create(dateAdoption, idAnimal, idUser, statusAdoption);

  return result.status
    ? response.status(200).json({ success: true, id: result.id, message: 'Adoption successfully registered' })
    : result.error
      ? response.status(500).json({ success: false, message: 'Failed to register adoption', error: result.error })
      : response.status(400).json({ success: false, message: result.message });
}
