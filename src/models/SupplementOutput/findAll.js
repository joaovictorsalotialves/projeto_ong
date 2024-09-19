import { conn } from "../../data/connection.js";

export const findAll = async (nameSupplement, nameSupplementCategory, outputDate) => {
  try {
    let supplementOutputs = await conn
      .select([
        'supplementOutputs.idSupplementOutput',
        'supplementOutputs.description',
        'supplementOutputs.amount',
        'supplementOutputs.outputDate',
        'supplements.nameSupplement',
      ]).from('supplementoutputs')
      .join('supplements', 'supplementOutputs.Supplements_idSupplement', '=', 'supplements.idSupplement')
      .where(function () {
        if (nameSupplement) this.whereRaw("`nameSupplement` LIKE ? COLLATE utf8mb4_general_ci", [`%${nameSupplement}%`]);
        if (nameSupplementCategory) { nameSupplementCategory: nameSupplementCategory };
        if (outputDate) { outputDate: outputDate };
      }).orderBy([{ column: 'outputDate', order: 'desc' }]);
    return { status: true, values: supplementOutputs };
  } catch (error) {
    return { status: false, error: error };
  }
}
