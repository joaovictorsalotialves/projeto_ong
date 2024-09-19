import { conn } from "../../data/connection.js";

export const findById = async (idSupplementInput) => {
  try {
    let supplementInput = await conn
      .select().from('supplementinputs')
      .join('supplements', 'supplementInputs.Supplements_idSupplement', '=', 'supplements.idSupplement')
      .where({ idSupplementInput: idSupplementInput });
    return supplementInput.length > 0
      ? { status: true, values: supplementInput[0] }
      : { status: undefined };
  } catch (error) {
    return { status: false, error: error };
  }
}
