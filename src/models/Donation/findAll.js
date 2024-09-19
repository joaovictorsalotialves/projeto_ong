import { conn } from "../../data/connection.js";

export const findAll = async (nameUser, donationDate) => {
  try {
    let donations = await conn.select([
      'donations.idDonation',
      'donations.valueDonation',
      'donations.description',
      'donations.donationDate',
      'users.idUser',
      'users.nameUser',
      'donationCategories.idDonationCategory',
      'donationCategories.nameDonationCategory',
      'supplements.nameSupplement',
      'supplementInputs.amount'
    ]).from('donations')
      .leftJoin('users', 'donations.Users_idUser', '=', 'users.idUser')
      .join('donationcategories', 'donations.DonationCategories_idDonationCategory', '=', 'donationcategories.idDonationCategory')
      .leftJoin('supplementinputs', 'donations.SupplementInputs_idSupplementInput', '=', 'supplementinputs.idSupplementInput')
      .leftJoin('supplements', 'supplementinputs.Supplements_idSupplement', '=', 'supplements.idSupplement')
      .where(function () {
        if (donationDate) this.where({ donationDate: donationDate });
        if (nameUser) this.whereRaw("`nameUser` LIKE ? COLLATE utf8mb4_general_ci", [`%${nameUser}%`]);
      }).orderBy([{ column: 'donationDate', order: 'desc' }]);
    return { status: true, values: donations };
  } catch (error) {
    console.log(error)
    return { status: false, error: error };
  }
}
