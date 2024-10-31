import { findById } from "../../models/ExpenseCategory/findById.js";

export const selectExpenseCategoryController = async (request, response) => {
  let idExpenseCategory = request.params.idExpenseCategory;

  if (isNaN(idExpenseCategory)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let expenseCategory = await findById(idExpenseCategory);

  return expenseCategory.status
    ? response.status(200).json({ sucess: true, values: [expenseCategory.values] })
    : expenseCategory.status === undefined
      ? response.status(404).json({ sucess: false, message: 'Expense category not found' })
      : response.status(500).json({ sucess: false, message: 'Failed to fetch expense category', error: expenseCategory.error });
}
