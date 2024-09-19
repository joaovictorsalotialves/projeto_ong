import { conn } from "../../data/connection.js";
import { findById } from "./findById.js";
import { findByName } from "./findByName.js";

export const edit = async (idDonationCategory, nameDonationCategory) => {
  let donationCategory = await findById(idDonationCategory);
  let verificationNameDonationCategory = await findByName(nameDonationCategory);

  if (donationCategory.status) {
    if (verificationNameDonationCategory.status) {
      if (verificationNameDonationCategory.values.idDonationCategory != idDonationCategory) {
        return {
          status: false,
          message: 'Bad request: Donation category already registered'
        };
      }
    }

    try {
      await conn.update({
        nameDonationCategory: nameDonationCategory
      }).where({ idDonationCategory: idDonationCategory }).table('donationcategories');
      return { status: true };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Not found donation category'
  };
}
