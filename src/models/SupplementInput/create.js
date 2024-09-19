import { conn } from "../../data/connection.js";
import { editStock as SupplementEditStock } from "../Supplement/editStock.js";
import { findById as SupplementFindById } from "../Supplement/findById.js";

export const create = async (description, amount, inputDate, idSupplement) => {
  let supplement = await SupplementFindById(idSupplement);

  if (supplement.status) {
    try {
      let idSupplementInput = await conn.insert({
        description: description,
        amount: amount,
        inputDate: inputDate,
        Supplements_idSupplement: idSupplement
      }).table('supplementinputs').returning(['idSupplementInput']);
      await SupplementEditStock(idSupplement, amount);
      return { status: true, id: idSupplementInput[0] };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Invalid supplement ID'
  };
}
