import { conn } from "../../data/connection.js";
import { findById as SupplementCategoryFindById } from "../SupplementCategory/findById.js";
import { findById } from "./findById.js";
import { findByNsTmIdSC } from "./findByNsTmIdSC.js";

export const edit = async (idSupplement, nameSupplement, typeMensure, idSupplementCategory) => {
  let supplement = await findById(idSupplement);
  let verificationSupplement = await findByNsTmIdSC(nameSupplement, typeMensure, idSupplementCategory);

  if (supplement.status) {
    if (verificationSupplement.status) {
      if (supplement.values.idSupplement !== verificationSupplement.values.idSupplement) {
        return {
          status: false,
          message: 'Bad request: Supplement already registered'
        };
      }
    }

    let supplementCategory = await SupplementCategoryFindById(idSupplementCategory);

    if (supplementCategory.status) {
      try {
        await conn.update({
          nameSupplement: nameSupplement,
          typeMensure: typeMensure,
          SupplementCategories_idSupplementCategory: idSupplementCategory
        }).where({ idSupplement: idSupplement }).table('supplements');
        return { status: true, id: idSupplement };
      } catch (error) {
        return { status: false, error: error };
      }
    }

    return {
      status: false,
      message: "Bad request: Invalid supplement category ID"
    };
  }

  return {
    status: false,
    message: 'Bad request: Not found supplement'
  };
}
