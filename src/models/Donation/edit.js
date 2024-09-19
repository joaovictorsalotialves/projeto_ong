import { conn } from "../../data/connection.js";
import { findById as DonationCategoryFindById } from "../DonationCategory/findById.js";
import { create as SupplementInputCreate } from "../SupplementInput/create.js";
import { edit as SupplementInputEdit } from "../SupplementInput/edit.js";
import { findById as UserFindById } from "../User/findById.js";
import { findById } from "./findById.js";

export const edit = async (idDonation, valueDonation, description, donationDate, idUser, idDonationCategory, supplementInput) => {
  let donation = await findById(idDonation);

  if (donation.status) {
    let user = await UserFindById(idUser);
    let donationCategory = await DonationCategoryFindById(idDonationCategory);

    if (user.status && donationCategory.status) {
      if (supplementInput !== undefined) {
        let { description, amount, idSupplement } = supplementInput;
        let resultSupplementInput;
        if (donation.values.idSupplementInput) {
          resultSupplementInput = await SupplementInputEdit(donation.values.idSupplementInput, description, amount, idSupplement);
        } else {
          resultSupplementInput = await SupplementInputCreate(description, amount, donationDate, idSupplement);
        }

        if (resultSupplementInput.status) {
          try {
            await conn.insert({
              valueDonation: valueDonation,
              description: description,
              donationDate: donationDate,
              Users_idUser: idUser,
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
        await conn.insert({
          valueDonation: valueDonation,
          description: description,
          donationDate: donationDate,
          Users_idUser: idUser,
          DonationCategories_idDonationCategory: idDonationCategory
        }).table('donations').returning(['idDonation']);
        return { status: true, id: idDonation[0] };
      } catch (error) {
        return { status: false, error: error };
      }
    }

    return {
      status: false,
      message: user.status
        ? donationCategory.status
          ? 'Bad request: Invalid supplement input ID'
          : 'Bad request: Invalid donation category ID'
        : 'Bad request: Invalid user ID'
    };
  }

  return {
    status: false,
    message: 'Bad request: Not found donation'
  };
}
