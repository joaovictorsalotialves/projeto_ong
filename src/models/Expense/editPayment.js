import { conn } from "../../data/connection.js";
import { findById } from "./findById.js";

export const editPayment = async (idExpense, paymentDate) => {
  try {
    let expense = await findById(idExpense);

    if (!expense) {
      return {
        status: false,
        message: 'Despesa não encontrada.'
      };
    }

    let dueDate = new Date(expense.values.dueDate);
    let nowDate = new Date();

    let statusExpense = 'Não Paga';
    if (paymentDate) {
      statusExpense = 'Paga';
    } else if (dueDate < nowDate) {
      statusExpense = 'Atrasada';
    }

    await conn.update({
      paymentDate: paymentDate || null,
      statusExpense: statusExpense
    })
      .where({ idExpense: idExpense })
      .table('expenses');

    return { status: true };

  } catch (error) {
    console.error(error);
    return { status: false, error: 'Erro ao atualizar a despesa.' };
  }
}
