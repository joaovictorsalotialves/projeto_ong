import { conn } from "../../data/connection.js";

export const findById = async (idSupplement) => {
  try {
    let supplement = await conn
      .select().from('supplements')
      .join('supplementcategories', 'supplements.SupplementCategories_idSupplementCategory', '=', 'supplementcategories.idSupplementCategory')
      .where({ idSupplement: idSupplement });
    return supplement.length > 0
      ? { status: true, values: supplement[0] }
      : { status: undefined };
  } catch (error) {
    return { status: false, error: error };
  }
}
