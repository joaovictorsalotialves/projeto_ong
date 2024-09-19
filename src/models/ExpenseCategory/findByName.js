import { conn } from "../../data/connection.js";

export const findByName = async (nameExpenseCategory) => {
  try {
    let expenseCategory = await conn.select()
      .where({ nameExpenseCategory: nameExpenseCategory })
      .table('expensecategories');
    return expenseCategory.length > 0
      ? { status: true, values: expenseCategory[0] }
      : { status: undefined };
  } catch (error) {
    return { status: false, error: error };
  }
}
