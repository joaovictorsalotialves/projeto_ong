import { editPayment } from "../models/Expense/editPayment.js";
import { findAll } from "../models/Expense/findAll.js";

export const checkExpenseDate = async (request, response, next) => {
  try {
    const expenses = await findAll();

    if (!expenses.status) {
      return response.status(500).json({ message: 'Erro ao buscar as despesas.' });
    }

    const promises = expenses.values.map(async (expense) => {
      await editPayment(expense.idExpense, expense.paymentDate);
    });

    await Promise.all(promises);

    return next();

  } catch (error) {
    console.error("Erro ao processar as despesas:", error);
    return response.status(500).json({ message: 'Erro ao processar as despesas.' });
  }
}
