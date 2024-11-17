import express from "express";

import { Auth } from "../middlewares/Auth.js";
import { authResetPassword } from "../middlewares/AuthResetPassword.js";

import { forgotPasswordController } from "../controllers/EmployeeControllers/forgotPasswordController.js";
import { loginController } from "../controllers/EmployeeControllers/loginController.js";
import { logoutController } from "../controllers/EmployeeControllers/logoutController.js";
import { resetPasswordController } from "../controllers/EmployeeControllers/resetPasswordController.js";

import { deleteEmployeeAddressController } from "../controllers/EmployeeControllers/deleteEmployeeAddressController.js";
import { deleteEmployeeController } from "../controllers/EmployeeControllers/deleteEmployeeController.js";
import { insertEmployeeController } from "../controllers/EmployeeControllers/insertEmployeeController.js";
import { selectEmployeeController } from "../controllers/EmployeeControllers/selectEmployeeController.js";
import { selectEmployeesController } from "../controllers/EmployeeControllers/selectEmployeesController.js";
import { updateEmployeeController } from "../controllers/EmployeeControllers/updateEmployeeController.js";
import { updateEmployeePasswordController } from "../controllers/EmployeeControllers/updateEmployeePasswordController.js";

export const employeeRouters = express.Router();

const auth = new Auth();

employeeRouters.post('/login', loginController);
employeeRouters.post('/forgot-password', forgotPasswordController);
employeeRouters.post('/reset-password', authResetPassword, resetPasswordController);
employeeRouters.post('/logout/:idEmployee', logoutController);

employeeRouters.post('/', insertEmployeeController);

employeeRouters.put('/:idEmployee', auth.authEmployee, updateEmployeeController);
employeeRouters.patch('/:idEmployee/password', auth.authEmployee, updateEmployeePasswordController);

employeeRouters.get('/', auth.authEmployee, selectEmployeesController);
employeeRouters.get('/:idEmployee', auth.authEmployee, selectEmployeeController);

employeeRouters.delete('/:idEmployee', auth.authAdmin, deleteEmployeeController);
employeeRouters.delete('/:idEmployee/address', auth.authAdmin, deleteEmployeeAddressController);


