import { remove } from "../../models/Adoption/remove.js";

export const deleteAdoptionController = async (request, response) => {
  let idAdoption = request.params.idAdoption;

  if (isNaN(idAdoption)) return response.status(404).json({ success: false, message: 'Incorrect parameter' });

  let result = await remove(idAdoption);

  return result.status
    ? response.status(200).json({ success: true, message: 'Adoption deleted successfully' })
    : result.error
      ? response.status(500).json({ success: false, message: 'Failed to delete adoption', error: result.error })
      : response.status(400).json({ success: false, message: result.message });
}
