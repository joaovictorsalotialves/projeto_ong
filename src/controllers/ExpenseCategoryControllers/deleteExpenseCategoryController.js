import { remove } from "../../models/ExpenseCategory/remove.js";

export const deleteExpenseCategoryController = async (request, response) => {
  let idExpenseCategory = request.params.idExpenseCategory;

  if (isNaN(idExpenseCategory)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let result = await remove(idExpenseCategory);

  return result.status
    ? response.status(200).json({ sucess: true, message: 'Expense category deleted successfully' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to deleted expense category', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
