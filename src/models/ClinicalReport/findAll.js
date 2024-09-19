import { conn } from "../../data/connection.js";

export const findAll = async (nameEmployee, nameAnimal, registrationDate) => {
  try {
    let clinicalReports = await conn.select([
      'clinicalreports.idClinicalReport',
      'clinicalreports.registrationDate',
      'clinicalreports.editionDate',
      'clinicalreports.descriptionClinicalReport',
      'employees.nameEmployee',
      'animals.nameAnimal'
    ])
      .from('clinicalreports')
      .join('employees', 'clinicalreports.Employees_idEmployee', '=', 'employees.idEmployee')
      .join('animals', 'clinicalreports.Animals_idAnimal', '=', 'animals.idAnimal')
      .where(function () {
        if (nameEmployee) this.whereRaw("`nameEmployee` LIKE ? COLLATE utf8mb4_general_ci", [`%${nameEmployee}%`]);
        if (nameAnimal) this.whereRaw("`nameEmployee` LIKE ? COLLATE utf8mb4_general_ci", [`%${nameEmployee}%`]);
        if (registrationDate) this.where({ registrationDate: registrationDate });
      });
    return { status: true, values: clinicalReports };
  } catch (error) {
    return { status: false, error: error };
  }
}
