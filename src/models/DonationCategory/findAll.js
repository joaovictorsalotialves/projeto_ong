import { conn } from "../../data/connection.js";

export const findAll = async (nameDonationCategory) => {
  try {
    let donationCategories = await conn.select()
      .where(function () {
        if (nameDonationCategory) this.whereRaw("`nameDonationCategory` LIKE ? COLLATE utf8mb4_general_ci", [`%${nameDonationCategory}%`]);
      }).orderBy([{ column: 'nameDonationCategory', order: 'asc' }])
      .table('donationcategories');
    return { status: true, values: donationCategories };
  } catch (error) {
    return { status: false, error: error };
  }
}
