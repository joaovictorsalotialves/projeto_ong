import { findAll } from "../../models/ClinicalReport/findAll.js";

export const selectClinicalReportsController = async (request, response) => {
  let { nameEmployee, nameAnimal, registrationDate } = request.query;

  let clinicalReports = await findAll(nameEmployee, nameAnimal, registrationDate);

  return clinicalReports.status
    ? response.status(200).json({ success: true, values: clinicalReports.values })
    : response.status(500).json({ success: false, message: 'Failed to fetch clinical reports', error: clinicalReports.error });
}
