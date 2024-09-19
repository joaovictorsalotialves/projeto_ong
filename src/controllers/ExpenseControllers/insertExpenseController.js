import { create } from "../../models/Expense/create.js";

export const insertExpenseController = async (request, response) => {
  let { valueExpense, description, paymentDate, dueDate, idExpenseCategory } = request.body;

  if (!valueExpense || !dueDate || !idExpenseCategory) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  let nowDate = new Date();
  let registrationDate = `${nowDate.getUTCFullYear()}-${String(nowDate.getUTCMonth() + 1).padStart(2, '0')}-${String(nowDate.getUTCDate()).padStart(2, '0')}`;

  let result = await create(valueExpense, description, registrationDate, paymentDate, dueDate, idExpenseCategory)

  return result.status
    ? response.status(200).json({ sucess: true, id: result.id, message: 'Expense successfully registered' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to registered expense', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
