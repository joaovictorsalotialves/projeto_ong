import { conn } from "../../data/connection.js";

export const findById = async (idDonation) => {
  try {
    let donation = await conn.select([
      'donations.idDonation',
      'donations.valueDonation',
      'donations.description',
      'donations.donationDate',
      'users.idUser',
      'users.nameUser',
      'donationCategories.idDonationCategory',
      'donationCategories.nameDonationCategory',
      'supplements.idSupplement',
      'supplements.nameSupplement',
      'supplementInputs.idSupplementInput',
      'supplementInputs.amount',
      'supplementInputs.description',
    ]).from('donations')
      .leftJoin('users', 'donations.Users_idUser', '=', 'users.idUser')
      .join('donationcategories', 'donations.DonationCategories_idDonationCategory', '=', 'donationcategories.idDonationCategory')
      .leftJoin('supplementinputs', 'donations.SupplementInputs_idSupplementInput', '=', 'supplementinputs.idSupplementInput')
      .leftJoin('supplements', 'supplementinputs.Supplements_idSupplement', '=', 'supplements.idSupplement')
      .where({ idDonation: idDonation });
    return donation.length > 0
      ? { status: true, values: donation[0] }
      : { status: undefined };
  } catch (error) {
    return { status: false, error: error };
  }
}
