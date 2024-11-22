import { conn } from "../../data/connection.js";
import { findById as DonationCategoryFindById } from "../DonationCategory/findById.js";
import { create as SupplementInputCreate } from "../SupplementInput/create.js";
import { edit as SupplementInputEdit } from "../SupplementInput/edit.js";
import { findById as UserFindById } from "../User/findById.js";
import { findById } from "./findById.js";

export const edit = async (idDonation, valueDonation, description, donationDate, idUser, idDonationCategory, supplementInput) => {
  let donation = await findById(idDonation);

  if (donation.status) {
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
        let { description, amount, idSupplement } = supplementInput;
        let resultSupplementInput;
        if (donation.values.idSupplementInput) {
          resultSupplementInput = await SupplementInputEdit(donation.values.idSupplementInput, description, amount, idSupplement);
        } else {
          resultSupplementInput = await SupplementInputCreate(description, amount, donationDate, idSupplement);
        }

        if (resultSupplementInput.status) {
          try {
            await conn.update({
              valueDonation: valueDonation,
              description: description,
              donationDate: donationDate,
              Users_idUser: idUser ? idUser : null,
              DonationCategories_idDonationCategory: idDonationCategory,
              SupplementInputs_idSupplementInput: resultSupplementInput.id
            }).where({ idDonation: idDonation }).table('donations');
            return { status: true };
          } catch (error) {
            return { status: false, error: error };
          }
        }

        return { ...resultSupplementInput }
      }

      try {
        await conn.update({
          valueDonation: valueDonation,
          description: description,
          donationDate: donationDate,
          Users_idUser: idUser ? idUser : null,
          DonationCategories_idDonationCategory: idDonationCategory
        }).where({ idDonation: idDonation }).table('donations');
        return { status: true };
      } catch (error) {
        return { status: false, error: error };
      }
    }

    return {
      status: false,
      message: 'Bad request: Invalid donation category ID',
    };
  }

  return {
    status: false,
    message: 'Bad request: Not found donation'
  };
}
