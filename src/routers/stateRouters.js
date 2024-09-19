import express from "express";

import { selectStateController } from "../controllers/StateControllers/selectStateController.js";
import { selectStatesController } from "../controllers/StateControllers/selectStatesController.js";

export const stateRouters = express.Router();

stateRouters.get('/', selectStatesController);
stateRouters.get('/:idState', selectStateController);
