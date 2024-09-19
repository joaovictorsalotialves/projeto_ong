import { conn } from "../../data/connection.js";

export const findAll = async (nameExpenseCategory) => {
  try {
    let expenseCategories = await conn.select()
    .where(function () {
      if (nameExpenseCategory) this.whereRaw("`nameExpenseCategory` LIKE ? COLLATE utf8mb4_general_ci", [`%${nameExpenseCategory}%`]);
    }).orderBy([{ column: 'nameExpenseCategory', order: 'asc' }])
    .table('expensecategories');
    return { status: true, values: expenseCategories };
  } catch (error) {
    return { status: false, error: error };
  }
}
