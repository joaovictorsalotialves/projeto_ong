import { findAll } from "../../models/Donation/findAll.js";

export const selectDonationsController = async (request, response) => {
  let { nameUser, donationDate } = request.query;

  let donations = await findAll(nameUser, donationDate);

  return donations.status
    ? response.status(200).json({ sucess: true, values: donations.values })
    : response.status(500).json({ sucess: false, messagem: 'Failed to fetch donations', error: donations.error });
}
