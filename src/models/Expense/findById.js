import { conn } from "../../data/connection.js";

export const findById = async (idExpense) => {
  try {
    let expense = await conn
      .select([
        'idExpense',
        'valueExpense',
        'description',
        'registrationDate',
        'paymentDate',
        'dueDate',
        'statusExpense',
        'expensecategories.idExpenseCategory',
        'expensecategories.nameExpenseCategory',
      ]).from('expenses')
      .join('expensecategories', 'expenses.ExpenseCategories_idExpenseCategory', '=', 'expensecategories.idExpenseCategory')
      .where({ idExpense: idExpense });
    return expense.length > 0
      ? { status: true, values: expense[0] }
      : { status: undefined };
  } catch (error) {
    return { status: false, error: error };
  }
}
