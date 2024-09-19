import { conn } from "../../data/connection.js";

export const findById = async (idSupplementCategory) => {
  try {
    let supplementCategory = await conn.select()
      .where({ idSupplementCategory: idSupplementCategory })
      .table('supplementcategories');
    return supplementCategory.length > 0
      ? { status: true, values: supplementCategory[0] }
      : { status: undefined };
  } catch (error) {
    return { status: false, error: error };
  }
}
