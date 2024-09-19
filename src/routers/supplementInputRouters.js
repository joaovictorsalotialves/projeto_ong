import express from "express";

import { deleteSupplementInputController } from "../controllers/SupplementInputControllers/deleteSupplementInputController.js";
import { insertSupplementInputController } from "../controllers/SupplementInputControllers/insertSupplementInputController.js";
import { selectSupplementInputController } from "../controllers/SupplementInputControllers/selectSupplementInputController.js";
import { selectSupplementInputsController } from "../controllers/SupplementInputControllers/selectSupplementInputsController.js";
import { updateSupplementInputController } from "../controllers/SupplementInputControllers/updateSupplementInputController.js";

export const supplementInputRouters = express.Router();

supplementInputRouters.post('/', insertSupplementInputController);

supplementInputRouters.put('/:idSupplementInput', updateSupplementInputController);

supplementInputRouters.get('/', selectSupplementInputsController);
supplementInputRouters.get('/:idSupplementInput', selectSupplementInputController);

supplementInputRouters.delete('/:idSupplementInput', deleteSupplementInputController);
