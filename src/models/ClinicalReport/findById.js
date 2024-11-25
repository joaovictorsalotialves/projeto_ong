import { conn } from "../../data/connection.js";

export const findById = async (idClinicalReport) => {
  try {
    let clinicalReport = await conn.select(
      'clinicalreports.idClinicalReport',
      'clinicalreports.registrationDate',
      'clinicalreports.editionDate',
      'clinicalreports.descriptionClinicalReport',
      'employees.idEmployee',
      'employees.nameEmployee',
      'animals.idAnimal',
      'animals.nameAnimal',
      'species.idSpecies',
      'species.nameSpecies',
      'races.idRace',
      'races.nameRace',
    )
      .from('clinicalreports')
      .join('employees', 'clinicalreports.Employees_idEmployee', '=', 'employees.idEmployee')
      .join('animals', 'clinicalreports.Animals_idAnimal', '=', 'animals.idAnimal')
      .join('species', 'animals.Species_idSpecies', '=', 'species.idSpecies')
      .join('races', 'animals.Races_idRace', '=', 'races.idRace')
      .where({ 'clinicalreports.idClinicalReport': idClinicalReport });
    return clinicalReport.length > 0
      ? { status: true, values: clinicalReport[0] }
      : { status: undefined };
  } catch (error) {
    return { status: false, error: error };
  }
}
