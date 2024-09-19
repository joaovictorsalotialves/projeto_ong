import { conn } from "../../data/connection.js";
import { findById as ExpenseCategoryFindById } from "../ExpenseCategory/findById.js";

export const create = async (valueExpense, description, registrationDate, paymentDate, dueDate, idExpenseCategory) => {
  let expenseCategory = await ExpenseCategoryFindById(idExpenseCategory);

  if (expenseCategory.status) {
    let statusExpense = paymentDate ? 'paid' : dueDate < registrationDate ? 'overdue' : 'not paid';

    try {
      let idExpense = await conn.insert({
        valueExpense: valueExpense,
        description: description,
        registrationDate: registrationDate,
        paymentDate: paymentDate,
        dueDate: dueDate,
        statusExpense: statusExpense,
        ExpenseCategories_idExpenseCategory: idExpenseCategory
      }).table('expenses').returning(['idExpense']);
      return { status: true, id: idExpense[0] };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Invalid expense category ID'
  };
}
