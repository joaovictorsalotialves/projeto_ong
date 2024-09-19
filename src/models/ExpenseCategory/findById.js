import { conn } from "../../data/connection.js";

export const findById = async (idExpenseCategory) => {
  try {
    let expenseCategory = await conn.select()
      .where({ idExpenseCategory: idExpenseCategory })
      .table('expensecategories');
    return expenseCategory.length > 0
      ? { status: true, values: expenseCategory[0] }
      : { status: undefined };
  } catch (error) {
    return { status: false, error: error };
  }
}
