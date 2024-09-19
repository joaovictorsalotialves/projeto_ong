import express from "express";

import { deleteSupplementOutputController } from "../controllers/SupplementOutputControllers/deleteSupplementOutputController.js";
import { insertSupplementOutputController } from "../controllers/SupplementOutputControllers/insertSupplementOutputController.js";
import { selectSupplementOutputController } from "../controllers/SupplementOutputControllers/selectSupplementOutputController.js";
import { selectSupplementOutputsController } from "../controllers/SupplementOutputControllers/selectSupplementOutputsController.js";
import { updateSupplementOutputController } from "../controllers/SupplementOutputControllers/updateSupplementOutputController.js";

export const supplementOutputRouters = express.Router();

supplementOutputRouters.post('/', insertSupplementOutputController);

supplementOutputRouters.put('/:idSupplementOutput', updateSupplementOutputController);

supplementOutputRouters.get('/', selectSupplementOutputsController);
supplementOutputRouters.get('/:idSupplementOutput', selectSupplementOutputController);

supplementOutputRouters.delete('/:idSupplementOutput', deleteSupplementOutputController);
