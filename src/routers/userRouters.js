import express from "express";

import { deleteUserAddressController } from "../controllers/UserControllers/deleteUserAddressController.js";
import { deleteUserController } from "../controllers/UserControllers/deleteUserController.js";
import { insertUserController } from "../controllers/UserControllers/insertUserController.js";
import { selectUserController } from "../controllers/UserControllers/selectUserController.js";
import { selectUsersController } from "../controllers/UserControllers/selectUsersController.js";
import { updateUserController } from "../controllers/UserControllers/updateUserController.js";

export const userRouters = express.Router();

userRouters.post('/', insertUserController);

userRouters.put('/:idUser', updateUserController);

userRouters.get('/', selectUsersController);
userRouters.get('/:idUser', selectUserController);

userRouters.delete('/:idUser', deleteUserController);
userRouters.delete('/:idUser/address', deleteUserAddressController);
