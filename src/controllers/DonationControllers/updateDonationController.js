import { edit } from "../../models/Donation/edit.js";

export const updateDonationController = async (request, response) => {
  let idDonation = request.params.idDonation;
  let { valueDonation, description, idUser, idDonationCategory, supplementInput } = request.body;

  if (!idDonationCategory) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  if (!valueDonation && !supplementInput) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: No value assigned for donation'
    });
  }

  if (supplementInput !== undefined) {
    let { amount, idSupplement } = supplementInput;
    if (!amount || !idSupplement) {
      return response.status(400).json({
        success: false,
        message: 'Bad request: Missing required fields'
      });
    }
  }

  let nowDate = new Date();
  let donationDate = `${nowDate.getUTCFullYear()}-${String(nowDate.getUTCMonth() + 1).padStart(2, '0')}-${String(nowDate.getUTCDate()).padStart(2, '0')}`;

  let result = await edit(idDonation, valueDonation, description, donationDate, idUser, idDonationCategory, supplementInput);

  return result.status
    ? response.status(200).json({ sucess: true, id: result.id, message: 'Donation updated successfully' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to updated donation', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
