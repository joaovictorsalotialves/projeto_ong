import { conn } from "../../data/connection.js";

export const findByNsTmIdSC = async (nameSupplement, typeMensure, idSupplementCategory) => {
  try {
    let supplement = await conn
      .select().from('supplements')
      .join('supplementcategories', 'supplements.SupplementCategories_idSupplementCategory', '=', 'supplementcategories.idSupplementCategory')
      .andWhere({
        nameSupplement: nameSupplement,
        typeMensure: typeMensure,
        idSupplementCategory: idSupplementCategory
      });
    return supplement.length > 0
      ? { status: true, values: supplement[0] }
      : { status: undefined };
  } catch (error) {
    return { status: false, error: error };
  }
}
