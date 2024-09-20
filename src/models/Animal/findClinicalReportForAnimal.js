import { conn } from '../../data/connection.js';
import { findById } from "./findById.js";

export const findClinicalReportForAnimal = async (idAnimal, registrationDate) => {
  const animal = await findById(idAnimal);

  if (animal.status) {
    try {
      let clinicalReport = await conn.select([
        'clinicalreports.idClinicalReport',
        'clinicalreports.registrationDate',
        'clinicalreports.editionDate',
        'clinicalreports.descriptionClinicalReport',
        'animals.idAnimal',
        'animals.nameAnimal',
        'employees.idEmployee',
        'employees.nameEmployee'
      ]).from('clinicalreports')
        .join('animals', 'clinicalreports.Animals_idAnimal', '=', 'animals.idAnimal')
        .join('employees', 'clinicalreports.Employees_idEmployee', '=', 'employees.idEmployee')
        .where({ idAnimal: idAnimal })
        .where(function () {
          if (registrationDate) this.where({ registrationDate: registrationDate });
        }).orderBy([{ column: 'registrationDate', order: 'desc' }]);
      return { status: true, values: clinicalReport };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Not found animal'
  };
}
