import { conn } from "../../data/connection.js";
import { editStock as SupplementEditStock } from "../Supplement/editStock.js";
import { findById as SupplementFindById } from "../Supplement/findById.js";
import { findById } from "./findById.js";

export const edit = async (idSupplementInput, description, amount, idSupplement) => {
  let supplementInput = await findById(idSupplementInput);

  if (supplementInput.status) {
    let supplement = await SupplementFindById(idSupplement);

    if (supplement.status) {
      try {
        await conn.update({
          description: description,
          amount: amount,
          Supplements_idSupplement: idSupplement
        }).where({ idSupplementInput: idSupplementInput }).table('supplementinputs');
        await SupplementEditStock(idSupplement, amount - supplementInput.values.amount);
        return { status: true };
      } catch (error) {
        console.log(error)
        return { status: false, error: error };
      }
    }

    return {
      status: false,
      message: 'Bad request: Invalid supplement ID'
    };
  }

  return {
    status: false,
    message: 'Bad request: Not found supplement input'
  };
}
