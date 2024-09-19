import { conn } from "../../data/connection.js";
import { findById } from "./findById.js";

export const remove = async (idSupplementCategory) => {
  let supplementCategory = await findById(idSupplementCategory);

  if (supplementCategory.status) {
    try {
      await conn.delete().where({ idSupplementCategory: idSupplementCategory }).table('supplementcategories');
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
