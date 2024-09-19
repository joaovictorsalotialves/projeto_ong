import { conn } from "../../data/connection.js";
import { findById as AnimalFindById } from "../Animal/findById.js";
import { findById as EmployeeFindById } from "../Employee/findById.js";

export const create = async (registrationDate, descriptionClinicalReport, idEmployee, idAnimal) => {
  let employee = await EmployeeFindById(idEmployee);
  let animal = await AnimalFindById(idAnimal);

  if (employee.status && animal.status) {
    try {
      let idClinicalReport = await conn.insert({
        registrationDate: registrationDate,
        descriptionClinicalReport: descriptionClinicalReport,
        Employees_idEmployee: idEmployee,
        Animals_idAnimal: idAnimal
      }).table('clinicalreports').returning(['idClinicalReport']);
      return { status: true, id: idClinicalReport[0] };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: employee.status
      ? 'Bad request: Invalid animal ID'
      : animal.status
        ? 'Bad request: Invalid employee ID'
        : 'Bad request: Error with idEmployee and idAnimal'
  };
}
