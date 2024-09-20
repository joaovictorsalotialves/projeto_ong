import { conn } from "../../data/connection.js";
import { findById } from "./findById.js";

export const findDonationForUser = async (idUser, donationDate) => {
  let user = await findById(idUser);

  if (user.status) {
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
        'supplementInputs.idSupplementInput',
        'supplementInputs.amount'
      ]).from('donations')
        .leftJoin('users', 'donations.Users_idUser', '=', 'users.idUser')
        .join('donationcategories', 'donations.DonationCategories_idDonationCategory', '=', 'donationcategories.idDonationCategory')
        .leftJoin('supplementinputs', 'donations.SupplementInputs_idSupplementInput', '=', 'supplementinputs.idSupplementInput')
        .leftJoin('supplements', 'supplementinputs.Supplements_idSupplement', '=', 'supplements.idSupplement')
        .where({ idUser: idUser })
        .where(function () {
          if (donationDate) this.where({ donationDate: donationDate });
        }).orderBy([{ column: 'donationDate', order: 'desc' }]);
      return { status: true, values: donations };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Not found user'
  };
}
