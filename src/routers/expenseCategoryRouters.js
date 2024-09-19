import express from "express";

import { insertExpenseCategoryController } from "../controllers/ExpenseCategoryControllers/insertExpenseCategoryController.js";
import { updateExpenseCategoryController } from "../controllers/ExpenseCategoryControllers/updateExpenseCategoryController.js";
import { selectExpenseCategoriesController } from "../controllers/ExpenseCategoryControllers/selectExpenseCategoriesController.js";
import { selectExpenseCategoryController } from "../controllers/ExpenseCategoryControllers/selectExpenseCategoryController.js";
import { deleteExpenseCategoryController } from "../controllers/ExpenseCategoryControllers/deleteExpenseCategoryController.js";

export const expenseCategoryRouters = express.Router();

expenseCategoryRouters.post('/', insertExpenseCategoryController);

expenseCategoryRouters.put('/:idExpenseCategory', updateExpenseCategoryController);

expenseCategoryRouters.get('/', selectExpenseCategoriesController);
expenseCategoryRouters.get('/:idExpenseCategory', selectExpenseCategoryController);

expenseCategoryRouters.delete('/:idExpenseCategory', deleteExpenseCategoryController);
