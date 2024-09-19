import { remove } from "../../models/Expense/remove.js";

export const deleteExpenseController = async (request, response) => {
  let idExpense = request.params.idExpense;

  if (isNaN(idExpense)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let result = await remove(idExpense);

  return result.status
    ? response.status(200).json({ sucess: true, message: 'Expense deleted successfully' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to deleted expense', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
