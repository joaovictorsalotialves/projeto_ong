import { findById } from "../../models/Donation/findById.js";

export const selectDonationController = async (request, response) => {
  let idDonation = request.params.idDonation;

  if (isNaN(idDonation)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let donation = await findById(idDonation);

  return donation.status
    ? response.status(200).json({ sucess: true, values: donation.values })
    : donation.status === undefined
      ? response.status(404).json({ sucess: false, message: 'Donation not found' })
      : response.status(500).json({ sucess: false, message: 'Failed to fetch donation', error: donation.error });
}
