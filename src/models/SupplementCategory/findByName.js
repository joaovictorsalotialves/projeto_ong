import { conn } from "../../data/connection.js";

export const findByName = async (nameSupplementCategory) => {
  try {
    let supplementCategory = await conn.select()
      .where({ nameSupplementCategory: nameSupplementCategory })
      .table('supplementcategories');
    return supplementCategory.length > 0
      ? { status: true, values: supplementCategory[0] }
      : { status: undefined };
  } catch (error) {
    return { status: false, error: error };
  }
}
