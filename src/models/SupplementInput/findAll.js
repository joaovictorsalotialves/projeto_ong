import { conn } from "../../data/connection.js";

export const findAll = async (nameSupplement, nameSupplementCategory, inputDate) => {
  try {
    let supplementInputs = await conn.select([
      'supplementInputs.idSupplementInput',
      'supplementInputs.description',
      'supplementInputs.amount',
      'supplementInputs.inputDate',
      'supplements.nameSupplement',
      'supplementcategories.nameSupplementCategory',
    ]).from('supplementinputs')
      .join('supplements', 'supplementinputs.Supplements_idSupplement', '=', 'supplements.idSupplement')
      .join('supplementcategories', 'supplements.SupplementCategories_idSupplementCategory', '=', 'supplementcategories.idSupplementCategory')
      .where(function () {
        if (nameSupplement) this.whereRaw("`nameSupplement` LIKE ? COLLATE utf8mb4_general_ci", [`%${nameSupplement}%`]);
        if (nameSupplementCategory) this.where({ nameSupplementCategory: nameSupplementCategory });
        if (inputDate) this.where({ inputDate: inputDate });
      }).orderBy([{ column: 'inputDate', order: 'desc' }]);
    return { status: true, values: supplementInputs };
  } catch (error) {
    return { status: false, error: error };
  }
}
