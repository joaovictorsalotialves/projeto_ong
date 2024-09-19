import { conn } from "../../data/connection.js";
import { findById as SupplementCategoryFindById } from "../SupplementCategory/findById.js";
import { findByNsTmIdSC } from "./findByNsTmIdSC.js";

export const create = async (nameSupplement, stock, typeMensure, idSupplementCategory) => {
  let supplementCategory = await SupplementCategoryFindById(idSupplementCategory);

  if (supplementCategory.status) {
    let verificationSupplement = await findByNsTmIdSC(nameSupplement, typeMensure, idSupplementCategory);

    if (verificationSupplement.status) {
      return {
        status: false,
        message: 'Bad request: Supplement already registered'
      };
    }

    try {
      let idSupplement = await conn.insert({
        nameSupplement: nameSupplement,
        stock: stock,
        typeMensure: typeMensure,
        SupplementCategories_idSupplementCategory: idSupplementCategory
      }).table('supplements').returning(['idSupplement']);
      return { status: true, id: idSupplement[0] };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Invalid supplement category ID'
  };
}
