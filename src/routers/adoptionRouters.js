import express from "express";

import { deleteAdoptionController } from "../controllers/AdoptionControllers/deleteAdoptionController.js";
import { insertAdoptionController } from "../controllers/AdoptionControllers/insertAdoptionController.js";
import { selectAdoptionController } from "../controllers/AdoptionControllers/selectAdoptionController.js";
import { selectAdoptionsController } from "../controllers/AdoptionControllers/selectAdoptionsController.js";
import { updateAdoptionController } from "../controllers/AdoptionControllers/updateAdoptionController.js";
import { updateAdoptionStatusController } from "../controllers/AdoptionControllers/updateAdoptionStatusController.js";

export const adoptionRouters = express.Router();

adoptionRouters.post('/', insertAdoptionController);

adoptionRouters.put('/:idAdoption', updateAdoptionController);

adoptionRouters.patch('/:idAdoption', updateAdoptionStatusController);

adoptionRouters.get('/', selectAdoptionsController);
adoptionRouters.get('/:idAdoption', selectAdoptionController);

adoptionRouters.delete('/:idAdoption', deleteAdoptionController);
