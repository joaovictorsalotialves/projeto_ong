import express from "express";

import { insertSpeciesController } from "../controllers/SpeciesControllers/insertSpeciesController.js";
import { updateSpeciesController } from "../controllers/SpeciesControllers/updateSpeciesController.js";
import { selectSpeciesController } from "../controllers/SpeciesControllers/selectSpeciesController.js";
import { selectOneSpeciesController } from "../controllers/SpeciesControllers/selectOneSpeciesController.js";
import { deleteSpeciesController } from "../controllers/SpeciesControllers/deleteSpeciesController.js";

export const speciesRouters = express.Router();

speciesRouters.post('/', insertSpeciesController);

speciesRouters.put('/:idSpecies', updateSpeciesController);

speciesRouters.get('/', selectSpeciesController);
speciesRouters.get('/:idSpecies', selectOneSpeciesController);

speciesRouters.delete('/:idSpecies', deleteSpeciesController);
