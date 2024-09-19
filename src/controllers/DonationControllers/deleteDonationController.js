import { remove } from "../../models/Donation/remove.js";

export const deleteDonationController = async (request, response) => {
  let idDonation = request.params.idDonation;

  if (isNaN(idDonation)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let result = await remove(idDonation);

  return result.status
    ? response.status(200).json({ sucess: true, message: 'Donation deleted successfully' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to deleted donation', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
