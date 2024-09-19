import express from "express";

import { deleteAnimalController } from "../controllers/AnimalControllers/deleteAnimalController.js";
import { insertAnimalController } from "../controllers/AnimalControllers/insertAnimalController.js";
import { selectAnimalController } from "../controllers/AnimalControllers/selectAnimalController.js";
import { selectAnimalsController } from "../controllers/AnimalControllers/selectAnimalsController.js";
import { updateAnimalController } from "../controllers/AnimalControllers/updateAnimalController.js";
import { updateAnimalStatusController } from "../controllers/AnimalControllers/updateAnimalStatusController.js";

export const animalRouters = express.Router();

animalRouters.post('/', insertAnimalController);

animalRouters.put('/:idAnimal', updateAnimalController);

animalRouters.patch('/:idAnimal', updateAnimalStatusController);

animalRouters.get('/', selectAnimalsController);
animalRouters.get('/:idAnimal', selectAnimalController);

animalRouters.delete('/:idAnimal', deleteAnimalController);
