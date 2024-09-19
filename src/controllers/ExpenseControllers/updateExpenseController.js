import { edit } from "../../models/Expense/edit.js";

export const updateExpenseController = async (request, response) => {
  let idExpense = request.params.idExpense;
  let { valueExpense, description, paymentDate, dueDate, idExpenseCategory } = request.body;

  if (isNaN(idExpense)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  if (!valueExpense || !dueDate || !idExpenseCategory) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  let result = await edit(idExpense, valueExpense, description, paymentDate, dueDate, idExpenseCategory)

  return result.status
    ? response.status(200).json({ sucess: true, message: 'Expense changed successfully' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to changed expense', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
