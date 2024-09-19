import { conn } from "../../data/connection.js";

export const findById = async (idClinicalReport) => {
  try {
    let clinicalReport = await conn
      .select()
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
