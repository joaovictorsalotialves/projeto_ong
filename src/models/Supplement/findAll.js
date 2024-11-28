import { conn } from "../../data/connection.js";

export const findAll = async (nameSupplement, nameSupplementCategory, typeMensure) => {
  try {
    let supplements = await conn
      .select([
        'supplements.idSupplement',
        'supplements.nameSupplement',
        'supplements.stock',
        'supplements.typeMensure',
        'supplementcategories.idSupplementCategory',
        'supplementcategories.nameSupplementCategory',
      ]).from('supplements')
      .join('supplementcategories', 'supplements.SupplementCategories_idSupplementCategory', '=', 'supplementcategories.idSupplementCategory')
      .where(function () {
        if (nameSupplement) this.whereRaw("`nameSupplement` LIKE ? COLLATE utf8mb4_general_ci", [`%${nameSupplement}%`]);
        if (nameSupplementCategory) this.where({ nameSupplementCategory: nameSupplementCategory });
        if (typeMensure) this.where({ typeMensure: typeMensure });
      }).orderBy([{ column: 'nameSupplementCategory', order: 'asc' }, { column: 'nameSupplement', order: 'asc' }]);
    return { status: true, values: supplements };
  } catch (error) {
    return { status: false, error: error };
  }
}
