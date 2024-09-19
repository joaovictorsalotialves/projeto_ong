import { findAll } from "../../models/ExpenseCategory/findAll.js";

export const selectExpenseCategoriesController = async (request, response) => {
  let { nameExpenseCategory } = request.query;

  let expenseCategories = await findAll(nameExpenseCategory);

  return expenseCategories.status
    ? response.status(200).json({ sucess: true, values: expenseCategories.values })
    : response.status(500).json({ sucess: false, messagem: 'Failed to fetch expense categories', error: expenseCategories.error });
}
