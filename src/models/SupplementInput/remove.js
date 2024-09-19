import { conn } from "../../data/connection.js";
import { editStock as SupplementEditStock } from "../Supplement/editStock.js";
import { findById } from "./findById.js";

export const remove = async (idSupplementInput) => {
  let supplementInput = await findById(idSupplementInput);

  if (supplementInput.status) {
    try {
      await conn.delete().where({ idSupplementInput: idSupplementInput }).table('supplementinputs');
      await SupplementEditStock(supplementInput.values.Supplements_idSupplement, supplementInput.values.amount * -1);
      return { status: true };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Not found supplement input'
  };
}
