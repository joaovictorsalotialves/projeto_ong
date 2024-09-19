import { conn } from "../../data/connection.js";
import { findByName } from "./findByName.js";

export const create = async (nameDonationCategory) => {
  let donationCategory = await findByName(nameDonationCategory);

  if (donationCategory.status) {
    return {
      status: false,
      message: 'Bad request: Donation category already registered'
    };
  }

  try {
    let idDonationCategory = await conn.insert({
      nameDonationCategory: nameDonationCategory
    }).table('donationcategories').returning(['idDonationCategory']);
    return { status: true, id: idDonationCategory[0] };
  } catch (error) {
    return { status: false, error: error };
  }

}
