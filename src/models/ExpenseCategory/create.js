import { conn } from "../../data/connection.js";
import { findByName } from "./findByName.js";

export const create = async (nameExpenseCategory) => {
  let expenseCategory = await findByName(nameExpenseCategory);

  if (expenseCategory.status) {
    return {
      status: false,
      message: 'Bad request: Expense category already registered'
    };
  }

  try {
    let idExpenseCategory = await conn.insert({
      nameExpenseCategory: nameExpenseCategory
    }).table('expensecategories').returning(['idExpenseCategory']);
    return { status: true, id: idExpenseCategory[0] };
  } catch (error) {
    return { status: false, error: error };
  }
}
