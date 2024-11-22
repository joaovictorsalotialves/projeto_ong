import { conn } from "../../data/connection.js";
import { findById as ExpenseCategoryFindById } from "../ExpenseCategory/findById.js";
import { findById } from "./findById.js";

export const edit = async (idExpense, valueExpense, description, paymentDate, dueDate, idExpenseCategory) => {
  let expense = await findById(idExpense);

  if (expense.status) {
    let expenseCategory = await ExpenseCategoryFindById(idExpenseCategory);

    if (expenseCategory.status) {
      let nowDate = new Date();

      let statusExpense = paymentDate ? 'Paga' : dueDate > nowDate ? 'Atrasada' : 'Não Paga';

      try {
        await conn.update({
          valueExpense: valueExpense,
          description: description,
          paymentDate: paymentDate,
          dueDate: dueDate,
          statusExpense: statusExpense,
          ExpenseCategories_idExpenseCategory: idExpenseCategory
        }).where({ idExpense: idExpense }).table('expenses');
        return { status: true };
      } catch (error) {
        return { status: false, error: error };
      }
    }

    return {
      status: false,
      message: 'Bad request: Invalid expense category ID'
    };
  }

  return {
    status: false,
    message: 'Bad request: Not found expense'
  };
}