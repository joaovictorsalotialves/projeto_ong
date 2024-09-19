import { conn } from "../../data/connection.js";

export const findAll = async (nameSupplementCategory) => {
  try {
    let supplementCategories = await conn.select()
      .where(function () {
        if (nameSupplementCategory) this.whereRaw("`nameSupplementCategory` LIKE ? COLLATE utf8mb4_general_ci", [`%${nameSupplementCategory}%`]);
      }).orderBy([{ column: 'nameSupplementCategory', order: 'asc' }]).table('supplementcategories');
    return { status: true, values: supplementCategories };
  } catch (error) {
    return { status: false, error: error };
  }
}
