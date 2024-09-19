import express from "express";

import { deleteSupplementController } from "../controllers/SupplementControllers/deleteSupplementController.js";
import { insertSupplementController } from "../controllers/SupplementControllers/insertSupplementController.js";
import { selectSupplementController } from "../controllers/SupplementControllers/selectSupplementController.js";
import { selectSupplementsController } from "../controllers/SupplementControllers/selectSupplementsController.js";
import { updateSupplementController } from "../controllers/SupplementControllers/updateSupplementController.js";

export const supplementRouters = express.Router();

supplementRouters.post('/', insertSupplementController);

supplementRouters.put('/:idSupplement', updateSupplementController);

supplementRouters.get('/', selectSupplementsController);
supplementRouters.get('/:idSupplement', selectSupplementController);

supplementRouters.delete('/:idSupplement', deleteSupplementController);
