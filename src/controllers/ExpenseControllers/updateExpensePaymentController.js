import { editPayment } from "../../models/Expense/editPayment.js";

export const updateExpensePaymentController = async (request, response) => {
  let idExpense = request.params.idExpense;
  let { paymentDate } = request.body;

  if (isNaN(idExpense)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  if (!paymentDate) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  let result = await editPayment(idExpense, paymentDate);

  return result.status
    ? response.status(200).json({ sucess: true, message: 'Expense marked as paid' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to changed expense', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
