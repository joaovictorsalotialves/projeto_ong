import { conn } from "../../data/connection.js";

export const findById = async (idClinicalReport) => {
  try {
    let clinicalReport = await conn
      .select(
        'clinicalreports.idClinicalReport',
        'clinicalreports.registrationDate',
        'clinicalreports.editionDate',
        'clinicalreports.descriptionClinicalReport',
        'employees.idEmployee',
        'employees.nameEmployee',
        'animals.idAnimal',
        'animals.nameAnimal',
        'animals.Species_idSpecies',
        'animals.Races_idRace',
      )
      .from('clinicalreports')
      .join('employees', 'clinicalreports.Employees_idEmployee', '=', 'employees.idEmployee')
      .join('animals', 'clinicalreports.Animals_idAnimal', '=', 'animals.idAnimal')
      .where({ 'clinicalreports.idClinicalReport': idClinicalReport });
    return clinicalReport.length > 0
      ? { status: true, values: clinicalReport[0] }
      : { status: undefined };
  } catch (error) {
    return { status: false, error: error };
  }
}
