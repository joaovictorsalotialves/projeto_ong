import express from "express";

import { Auth } from "../middlewares/Auth.js";

import { deleteUserAddressController } from "../controllers/UserControllers/deleteUserAddressController.js";
import { deleteUserController } from "../controllers/UserControllers/deleteUserController.js";
import { insertUserController } from "../controllers/UserControllers/insertUserController.js";
import { selectAdoptionForUserController } from "../controllers/UserControllers/selectAdoptionForUserController.js";
import { selectDonationForUserController } from "../controllers/UserControllers/selectDonationForUserController.js";
import { selectUserController } from "../controllers/UserControllers/selectUserController.js";
import { selectUsersController } from "../controllers/UserControllers/selectUsersController.js";
import { updateUserController } from "../controllers/UserControllers/updateUserController.js";

export const userRouters = express.Router();

const auth = new Auth();

userRouters.post('/', auth.authEmployee, insertUserController);

userRouters.put('/:idUser', auth.authEmployee, updateUserController);

userRouters.get('/', auth.authEmployee, selectUsersController);
userRouters.get('/:idUser', auth.authEmployee, selectUserController);
userRouters.get('/:idUser/donation', selectDonationForUserController);
userRouters.get('/:idUser/adoption', selectAdoptionForUserController);

userRouters.delete('/:idUser', auth.authEmployee, deleteUserController);
userRouters.delete('/:idUser/address', auth.authEmployee, deleteUserAddressController);
