import { findAll } from "../../models/Expense/findAll.js";

export const selectExpensesController = async (request, response) => {
  let { statusExpense, dueDate } = request.query;

  let expenses = await findAll(statusExpense, dueDate);

  return expenses.status
    ? response.status(200).json({ sucess: true, values: expenses.values })
    : response.status(500).json({ sucess: false, messagem: 'Failed to fetch expenses', error: expenses.error })
}
