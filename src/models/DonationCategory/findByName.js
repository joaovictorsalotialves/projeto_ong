import { conn } from "../../data/connection.js";

export const findByName = async (nameDonationCategory) => {
  try {
    let donationCategory = await conn.select()
      .where({ nameDonationCategory: nameDonationCategory })
      .table('donationcategories');
    return donationCategory.length > 0
      ? { status: true, values: donationCategory[0] }
      : { status: undefined };
  } catch (error) {
    return { status: false, error: error };
  }
}
