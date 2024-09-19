import { conn } from "../../data/connection.js";
import { findById } from "./findById.js";

export const remove = async (idExpense) => {
  let expense = await findById(idExpense);

  if (expense.status) {
    try {
      await conn.delete().where({ idExpense: idExpense }).table('expenses');
      return { status: true };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Not found expense'
  };
}
