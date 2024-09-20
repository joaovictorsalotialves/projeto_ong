import { findClinicalReportForAnimal } from "../../models/Animal/findClinicalReportForAnimal.js";

export const selectClinicalReportForAnimalController = async (request, response) => {
  let idAnimal = request.params.idAnimal;
  let { registrationDate } = request.query;

  if (isNaN(idUser)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let clinicalReports = await findClinicalReportForAnimal(idAnimal, registrationDate);

  return clinicalReports.status
    ? response.status(200).json({ success: true, values: clinicalReports.values })
    : response.status(500).json({ success: false, message: 'Failed to fetch clinical reports', error: clinicalReports.error });
}
