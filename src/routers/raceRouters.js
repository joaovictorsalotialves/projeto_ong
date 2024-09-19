import express from "express";

import { insertRaceController } from "../controllers/RaceControllers/insertRaceController.js";
import { updateRaceController } from "../controllers/RaceControllers/updateRaceController.js";
import { selectRacesController } from "../controllers/RaceControllers/selectRacesController.js";
import { selectRaceController } from "../controllers/RaceControllers/selectRaceController.js";
import { deleteRaceController } from "../controllers/RaceControllers/deleteRaceController.js";

export const raceRouters = express.Router();

raceRouters.post('/', insertRaceController);

raceRouters.put('/:idRace', updateRaceController);

raceRouters.get('/', selectRacesController);
raceRouters.get('/:idRace', selectRaceController);

raceRouters.delete('/:idRace', deleteRaceController);
