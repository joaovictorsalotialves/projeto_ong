import { create } from "../../models/ExpenseCategory/create.js";

export const insertExpenseCategoryController = async (request, response) => {
  let { nameExpenseCategory } = request.body;
  nameExpenseCategory = nameExpenseCategory.toUpperCase();

  if (!nameExpenseCategory) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  let result = await create(nameExpenseCategory);

  return result.status
    ? response.status(200).json({ sucess: true, id: result.id, message: 'Expense category successfully registered' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to registered expense category', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
