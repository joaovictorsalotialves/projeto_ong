import { conn } from "../../data/connection.js";
import { findById } from "./findById.js";
import { findByName } from "./findByName.js";

export const edit = async (idSupplementCategory, nameSupplementCategory) => {
  let supplementCategory = await findById(idSupplementCategory);
  let verificationNameSupplementCategory = await findByName(nameSupplementCategory);

  if (supplementCategory.status) {
    if (verificationNameSupplementCategory.status) {
      if (verificationNameSupplementCategory.values.idSupplementCategory != idSupplementCategory) {
        return {
          status: false,
          message: 'Bad request: Supplement category already registered'
        };
      }
    }

    try {
      await conn.update({
        nameSupplementCategory: nameSupplementCategory
      }).where({ idSupplementCategory: idSupplementCategory }).table('supplementcategories');
      return { status: true };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Not found supplement category'
  };
}
