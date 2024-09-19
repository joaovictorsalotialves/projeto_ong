import { conn } from "../../data/connection.js";
import { findById } from "./findById.js";


export const remove = async (idExpenseCategory) => {
  let expenseCategory = await findById(idExpenseCategory);

  if (expenseCategory.status) {
    try {
      await conn.delete().where({ idExpenseCategory: idExpenseCategory }).table('expensecategories');
      return { status: true };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Not found expense category'
  };
}
