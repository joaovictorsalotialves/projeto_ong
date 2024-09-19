import { findAll } from "../../models/DonationCategory/findAll.js";

export const selectDonationCategoriesController = async (request, response) => {
  let { nameDonationCategory } = request.query;

  let donationCategories = await findAll(nameDonationCategory);

  return donationCategories.status
    ? response.status(200).json({ sucess: true, values: donationCategories.values })
    : response.status(500).json({ sucess: false, messagem: 'Failed to fetch donation categories', error: donationCategories.error });
}
