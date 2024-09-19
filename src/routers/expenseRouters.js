import express from "express";

import { checkExpenseDate } from "../middlewares/CheckExpenseDate.js";

import { deleteExpenseController } from "../controllers/ExpenseControllers/deleteExpenseController.js";
import { insertExpenseController } from "../controllers/ExpenseControllers/insertExpenseController.js";
import { selectExpenseController } from "../controllers/ExpenseControllers/selectExpenseController.js";
import { selectExpensesController } from "../controllers/ExpenseControllers/selectExpensesController.js";
import { updateExpenseController } from "../controllers/ExpenseControllers/updateExpenseController.js";
import { updateExpensePaymentController } from "../controllers/ExpenseControllers/updateExpensePaymentController.js";

export const expenseRouters = express.Router();

expenseRouters.post('/', insertExpenseController);

expenseRouters.put('/:idExpense', updateExpenseController);
expenseRouters.patch('/:idExpense', updateExpensePaymentController);

expenseRouters.get('/', checkExpenseDate, selectExpensesController);
expenseRouters.get('/:idExpense', selectExpenseController);

expenseRouters.delete('/:idExpense', deleteExpenseController);
