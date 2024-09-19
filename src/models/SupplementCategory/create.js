import { conn } from "../../data/connection.js";
import { findByName } from "./findByName.js";

export const create = async (nameSupplementCategory) => {
  let supplementCategory = await findByName(nameSupplementCategory);

  if (supplementCategory.status) {
    return {
      status: false,
      message: 'Bad request: Supplement category already registered'
    };
  }

  try {
    let idSupplementCategory = await conn.insert({
      nameSupplementCategory: nameSupplementCategory
    }).table('supplementcategories').returning(['idSupplementCategory']);
    return { status: true, id: idSupplementCategory[0] };
  } catch (error) {
    return { status: false, error: error };
  }
}
