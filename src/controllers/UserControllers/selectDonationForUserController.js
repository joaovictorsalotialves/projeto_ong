import { findDonationForUser } from "../../models/User/findDonationForUser.js";

export const selectDonationForUserController = async (request, response) => {
  let idUser = request.params.idUser;
  let { donationDate } = request.query;

  if (isNaN(idUser)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let donations = await findDonationForUser(idUser, donationDate);

  return donations.status
    ? response.status(200).json({ sucess: true, values: donations.values })
    : response.status(500).json({ sucess: false, message: 'Failed to fetch donations', error: donations.error });
}
