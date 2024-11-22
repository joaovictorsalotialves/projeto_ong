import { conn } from "../../data/connection.js";
import { findById as DonationCategoryFindById } from "../DonationCategory/findById.js";
import { create as SupplementInputCreate } from "../SupplementInput/create.js";
import { findById as UserFindById } from "../User/findById.js";

export const create = async (valueDonation, description, donationDate, idUser, idDonationCategory, supplementInput) => {
  if (idUser) {
    let user = await UserFindById(idUser);
    if (!user.status) {
      return {
        status: false,
        message: 'Bad request: Invalid user ID',
      };
    }
  }
  let donationCategory = await DonationCategoryFindById(idDonationCategory);

  if (donationCategory.status) {
    if (supplementInput !== undefined) {
      let { descriptionSupplementInput, amount, idSupplement } = supplementInput;
      let resultSupplementInput = await SupplementInputCreate(descriptionSupplementInput, amount, donationDate, idSupplement);

      if (resultSupplementInput.status) {
        try {
          let idDonation = await conn.insert({
            valueDonation: valueDonation,
            description: description,
            donationDate: donationDate,
            Users_idUser: idUser ? idUser : null,
            DonationCategories_idDonationCategory: idDonationCategory,
            SupplementInputs_idSupplementInput: resultSupplementInput.id
          }).table('donations').returning(['idDonation']);
          return { status: true, id: idDonation[0] };
        } catch (error) {
          return { status: false, error: error };
        }
      }

      return { ...resultSupplementInput }
    }

    try {
      let idDonation = await conn.insert({
        valueDonation: valueDonation,
        description: description,
        donationDate: donationDate,
        Users_idUser: idUser ? idUser : null,
        DonationCategories_idDonationCategory: idDonationCategory,
      }).table('donations').returning(['idDonation']);
      return { status: true, id: idDonation[0] };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Invalid donation category ID',
  };
}
