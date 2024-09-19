import { conn } from "../../data/connection.js";
import { findById } from "./findById.js";
import { findByName } from "./findByName.js";

export const edit = async (idExpenseCategory, nameExpenseCategory) => {
  let expenseCategory = await findById(idExpenseCategory);
  let verificationNameExpenseCategory = await findByName(nameExpenseCategory);

  if (expenseCategory.status) {
    if (verificationNameExpenseCategory.status) {
      if (verificationNameExpenseCategory.values.idExpenseCategory != idExpenseCategory) {
        return {
          status: false,
          message: 'Bad request: Expense category already registered'
        };
      }
    }

    try {
      await conn.update({
        nameExpenseCategory: nameExpenseCategory
      }).where({ idExpenseCategory: idExpenseCategory }).table('expensecategories');
      return { status: true };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Not found expense category'
  };
}
