import { conn } from "../../data/connection.js";
import { findById } from "./findById.js";

export const editPayment = async (idExpense, paymentDate) => {
  let expense = await findById(idExpense);

  let dueDate = new Date(expense.values.dueDate);
  let nowDate = new Date();

  let statusExpense = paymentDate ? 'paid' : dueDate < nowDate ? 'overdue' : 'not paid';

  if (expense.status) {
    try {
      await conn.update({
        paymentDate: paymentDate,
        statusExpense: statusExpense
      }).where({ idExpense: idExpense }).table('expenses');
      return { status: true };
    } catch (error) {
      console.log(error)
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Not found expense'
  };
}
