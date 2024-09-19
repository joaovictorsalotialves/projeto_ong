import { remove } from "../../models/DonationCategory/remove.js";

export const deleteDonationCategoryController = async (request, response) => {
  let idDonationCategory = request.params.idDonationCategory;

  if (isNaN(idDonationCategory)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let result = await remove(idDonationCategory);

  return result.status
    ? response.status(200).json({ sucess: true, message: 'Donation category deleted successfully' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to deleted donation category', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
