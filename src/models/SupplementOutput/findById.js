import { conn } from "../../data/connection.js";

export const findById = async (idSupplementOutput) => {
  try {
    let supplementOutputs = await conn
      .select().from('supplementoutputs')
      .join('supplements', 'supplementOutputs.Supplements_idSupplement', '=', 'supplements.idSupplement')
      .where({ idSupplementOutput: idSupplementOutput });
    return supplementOutputs.length > 0
      ? { status: true, values: supplementOutputs[0] }
      : { status: undefined };
  } catch (error) {
    return { status: false, error: error };
  }
}
