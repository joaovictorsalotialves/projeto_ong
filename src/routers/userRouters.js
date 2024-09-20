import express from "express";

import { deleteUserAddressController } from "../controllers/UserControllers/deleteUserAddressController.js";
import { deleteUserController } from "../controllers/UserControllers/deleteUserController.js";
import { insertUserController } from "../controllers/UserControllers/insertUserController.js";
import { selectAdoptionForUserController } from "../controllers/UserControllers/selectAdoptionForUserController.js";
import { selectDonationForUserController } from "../controllers/UserControllers/selectDonationForUserController.js";
import { selectUserController } from "../controllers/UserControllers/selectUserController.js";
import { selectUsersController } from "../controllers/UserControllers/selectUsersController.js";
import { updateUserController } from "../controllers/UserControllers/updateUserController.js";

export const userRouters = express.Router();

userRouters.post('/', insertUserController);

userRouters.put('/:idUser', updateUserController);

userRouters.get('/', selectUsersController);
userRouters.get('/:idUser', selectUserController);
userRouters.get('/:idUser/donation', selectDonationForUserController);
userRouters.get('/:idUser/adoption', selectAdoptionForUserController);

userRouters.delete('/:idUser', deleteUserController);
userRouters.delete('/:idUser/address', deleteUserAddressController);
