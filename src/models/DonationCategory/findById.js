import { conn } from "../../data/connection.js";

export const findById = async (idDonationCategory) => {
  try {
    let donationCategory = await conn.select()
      .where({ idDonationCategory: idDonationCategory })
      .table('donationcategories');
    return donationCategory.length > 0
      ? { status: true, values: donationCategory[0] }
      : { status: undefined };
  } catch (error) {
    return { status: false, error: error };
  }
}
