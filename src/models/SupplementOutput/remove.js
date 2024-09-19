import { conn } from "../../data/connection.js";
import { editStock as SupplementEditStock } from "../Supplement/editStock.js";
import { findById } from "./findById.js";

export const remove = async (idSupplementOutput) => {
  let supplementOutput = await findById(idSupplementOutput);

  if (supplementOutput.status) {
    try {
      await conn.delete().where({ idSupplementOutput: idSupplementOutput }).table('supplementoutputs');
      await SupplementEditStock(supplementOutput.values.Supplements_idSupplement, supplementOutput.values.amount);
      return { status: true };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Not found supplement output'
  };
}
