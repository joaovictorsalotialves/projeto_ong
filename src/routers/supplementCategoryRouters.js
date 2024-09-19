import express from "express";

import { deleteSupplementCategoryController } from "../controllers/SupplementCategoryControllers/deleteSupplementCategoryController.js";
import { insertSupplementCategoryController } from "../controllers/SupplementCategoryControllers/insertSupplementCategoryController.js";
import { selectSupplementCategoriesController } from "../controllers/SupplementCategoryControllers/selectSupplementCategoriesController.js";
import { selectSupplementCategoryController } from "../controllers/SupplementCategoryControllers/selectSupplementCategoryController.js";
import { updateSupplementCategoryController } from "../controllers/SupplementCategoryControllers/updateSupplementCategoryController.js";

export const supplementCategoryRouters = express.Router();

supplementCategoryRouters.post('/', insertSupplementCategoryController);

supplementCategoryRouters.put('/:idSupplementCategory', updateSupplementCategoryController);

supplementCategoryRouters.get('/', selectSupplementCategoriesController);
supplementCategoryRouters.get('/:idSupplementCategory', selectSupplementCategoryController);

supplementCategoryRouters.delete('/:idSupplementCategory', deleteSupplementCategoryController);
