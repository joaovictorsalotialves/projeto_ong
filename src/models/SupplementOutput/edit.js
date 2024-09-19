import { conn } from "../../data/connection.js";
import { editStock as SupplementEditStock } from "../Supplement/editStock.js";
import { findById as SupplementFindById } from "../Supplement/findById.js";
import { findById } from "./findById.js";

export const edit = async (idSupplementOutput, description, amount, idSupplement) => {
  let supplementOutput = await findById(idSupplementOutput);

  if (supplementOutput.status) {
    let supplement = await SupplementFindById(idSupplement);

    if (supplement.status) {
      try {
        await conn.update({
          description: description,
          amount: amount,
          Supplements_idSupplement: idSupplement
        }).where({ idSupplementOutput: idSupplementOutput }).table('supplementoutputs');
        await SupplementEditStock(idSupplement, (amount - supplementOutput.values.amount) * -1);
        return { status: true };
      } catch (error) {
        return { status: false, error: error };
      }
    }

    return {
      status: false,
      message: 'Bad request: Not found supplement'
    };
  }

  return {
    status: false,
    message: 'Bad request: Not found supplement output'
  };
}
