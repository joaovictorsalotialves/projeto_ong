import express from "express";

import { selectCitiesController } from "../controllers/CityControllers/selectCitiesController.js";
import { selectCityForStateController } from "../controllers/CityControllers/selectCitiesForStateController.js";
import { selectCityController } from "../controllers/CityControllers/selectCityController.js";

export const cityRouters = express.Router();

cityRouters.get('/', selectCitiesController);
cityRouters.get('/:idCity', selectCityController);
cityRouters.get('/state/:idState', selectCityForStateController);
