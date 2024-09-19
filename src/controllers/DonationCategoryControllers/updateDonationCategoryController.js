import { edit } from "../../models/DonationCategory/edit.js";

export const updateDonationCategoryController = async (request, response) => {
  let idDonationCategory = request.params.idDonationCategory;
  let { nameDonationCategory } = request.body;
  nameDonationCategory = nameDonationCategory.toUpperCase();

  if (isNaN(idDonationCategory)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  if (!nameDonationCategory) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  let result = await edit(idDonationCategory, nameDonationCategory);

  return result.status
    ? response.status(200).json({ sucess: true, message: 'Donation category changed successfully' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to changed donation category', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
