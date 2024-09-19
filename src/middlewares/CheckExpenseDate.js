import { editPayment } from "../models/Expense/editPayment.js";
import { findAll } from "../models/Expense/findAll.js";

export const checkExpenseDate = async (request, response, next) => {
  const expenses = await findAll();

  if (expenses.status) {
    expenses.values.forEach(async (expense) => {
      await editPayment(expense.idExpense, expense.paymentDate);
    });
  }

  return next();
}
