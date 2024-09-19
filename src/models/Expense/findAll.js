import { conn } from "../../data/connection.js";

export const findAll = async (statusExpense, dueDate) => {
  try {
    let expenses = await conn
      .select([
        'idExpense',
        'valueExpense',
        'description',
        'registrationDate',
        'paymentDate',
        'dueDate',
        'statusExpense',
        'expensecategories.nameExpenseCategory'
      ]).from('expenses')
      .join('expensecategories', 'expenses.ExpenseCategories_idExpenseCategory', '=', 'expensecategories.idExpenseCategory')
      .where(function () {
        if (statusExpense) this.where({statusExpense: statusExpense});
        if (dueDate) this.where({dueDate: dueDate});
      }).orderBy([{ column: 'dueDate', order: 'desc' }]);
    return { status: true, values: expenses };
  } catch (error) {
    return { status: false, error: error };
  }
}
