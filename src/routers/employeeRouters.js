import express from "express";

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

employeeRouters.post('/login', loginController);
employeeRouters.post('/forgot-password', forgotPasswordController);
employeeRouters.post('/reset-password', authResetPassword, resetPasswordController);
employeeRouters.post('/logout/:idEmployee', logoutController);

employeeRouters.post('/', insertEmployeeController);

employeeRouters.put('/:idEmployee', updateEmployeeController);
employeeRouters.patch('/:idEmployee/password', updateEmployeePasswordController);

employeeRouters.get('/', selectEmployeesController);
employeeRouters.get('/:idEmployee', selectEmployeeController);

employeeRouters.delete('/:idEmployee', deleteEmployeeController);
employeeRouters.delete('/:idEmployee/address', deleteEmployeeAddressController);
