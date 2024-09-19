import { findById } from "../../models/Expense/findById.js";

export const selectExpenseController = async (request, response) => {
  let idExpense = request.params.idExpense;

  if (isNaN(idExpense)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let expense = await findById(idExpense);

  return expense.status
    ? response.status(200).json({ sucess: true, values: expense.values })
    : expense.status === undefined
      ? response.status(404).json({ sucess: false, message: 'Bad request: Expense not found' })
      : response.status(500).json({ sucess: false, message: 'Failed to fetch expense', error: expense.error });
}
