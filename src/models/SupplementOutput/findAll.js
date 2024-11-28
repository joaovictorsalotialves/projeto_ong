import { conn } from "../../data/connection.js";

export const findAll = async (nameSupplement, nameSupplementCategory, outputDate) => {
  try {
    let supplementOutputs = await conn
      .select([
        'supplementOutputs.idSupplementOutput',
        'supplementOutputs.description',
        'supplementOutputs.amount',
        'supplementOutputs.outputDate',
        'supplements.idSupplement',
        'supplements.nameSupplement',
        'supplements.typeMensure',
        'supplementcategories.idSupplementCategory',
        'supplementcategories.nameSupplementCategory',
      ]).from('supplementoutputs')
      .join('supplements', 'supplementOutputs.Supplements_idSupplement', '=', 'supplements.idSupplement')
      .join('supplementcategories', 'supplements.SupplementCategories_idSupplementCategory', '=', 'supplementcategories.idSupplementCategory')
      .where(function () {
        if (nameSupplement) this.whereRaw("`nameSupplement` LIKE ? COLLATE utf8mb4_general_ci", [`%${nameSupplement}%`]);
        if (nameSupplementCategory) this.where({ nameSupplementCategory: nameSupplementCategory });
        if (outputDate) this.where({ outputDate: outputDate });
      }).orderBy([{ column: 'outputDate', order: 'desc' }]);
    return { status: true, values: supplementOutputs };
  } catch (error) {
    return { status: false, error: error };
  }
}
