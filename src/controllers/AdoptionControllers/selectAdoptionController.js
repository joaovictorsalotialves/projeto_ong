import { findById } from "../../models/Adoption/findById.js";

export const selectAdoptionController = async (request, response) => {
  let idAdoption = request.params.idAdoption;

  if (isNaN(idAdoption)) return response.status(404).json({ success: false, message: 'Incorrect parameter' });

  let adoption = await findById(idAdoption);

  return adoption.status
    ? response.status(200).json({ success: true, values: [adoption.values] })
    : adoption.status === undefined
      ? response.status(404).json({ success: false, message: 'Adoption not found' })
      : response.status(500).json({ success: false, message: 'Failed to fetch adoption', error: adoption.error });
}