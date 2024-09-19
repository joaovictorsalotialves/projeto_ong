import { conn } from "../../data/connection.js";
import { editStock as SupplementEditStock } from "../Supplement/editStock.js";
import { findById as SupplementFindById } from "../Supplement/findById.js";

export const create = async (description, amount, outputDate, idSupplement) => {
  let supplement = await SupplementFindById(idSupplement);

  if (supplement.status) {
    try {
      let idSupplementOutput = await conn.insert({
        description: description,
        amount: amount,
        outputDate: outputDate,
        Supplements_idSupplement: idSupplement
      }).table('supplementoutputs').returning(['idSupplementOutput']);
      await SupplementEditStock(idSupplement, amount * -1);
      return { status: true, id: idSupplementOutput[0] };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Invalid supplement ID'
  };
}
