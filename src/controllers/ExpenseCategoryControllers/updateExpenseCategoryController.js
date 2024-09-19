import { edit } from "../../models/ExpenseCategory/edit.js";

export const updateExpenseCategoryController = async (request, response) => {
  let idExpenseCategory = request.params.idExpenseCategory;
  let { nameExpenseCategory } = request.body;
  nameExpenseCategory = nameExpenseCategory.toUpperCase();

  if (isNaN(idExpenseCategory)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  if (!nameExpenseCategory) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  let result = await edit(idExpenseCategory, nameExpenseCategory);

  return result.status
    ? response.status(200).json({ sucess: true, message: 'Expense category changed successfully' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to changed expense category', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
