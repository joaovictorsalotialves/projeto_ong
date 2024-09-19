import { findById } from "../../models/DonationCategory/findById.js";

export const selectDonationCategoryController = async (request, response) => {
  let idDonationCategory = request.params.idDonationCategory;

  if (isNaN(idDonationCategory)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let donationCategory = await findById(idDonationCategory);

  return donationCategory.status
    ? response.status(200).json({ sucess: true, values: donationCategory.values })
    : donationCategory.status === undefined
      ? response.status(404).json({ sucess: false, message: 'Donation category not found' })
      : response.status(500).json({ sucess: false, message: 'Failed to fetch donation category', error: donationCategory.error });
}
