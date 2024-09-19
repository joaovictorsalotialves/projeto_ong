import { create } from "../../models/DonationCategory/create.js";

export const insertDonationCategoryController = async (request, response) => {
  let { nameDonationCategory } = request.body;
  nameDonationCategory = nameDonationCategory.toUpperCase();

  if (!nameDonationCategory) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  let result = await create(nameDonationCategory);

  return result.status
    ? response.status(200).json({ sucess: true, id: result.id, message: 'Donation category successfully registered' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to registered donation category', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
