import { findById } from "../../models/ClinicalReport/findById.js";

export const selectClinicalReportController = async (request, response) => {
  let idClinicalReport = request.params.idClinicalReport;

  if (isNaN(idClinicalReport)) return response.status(404).json({ success: false, message: 'Incorrect parameter' });

  let clinicalReport = await findById(idClinicalReport);

  return clinicalReport.status
    ? response.status(200).json({ success: true, values: clinicalReport.values })
    : clinicalReport.status === undefined
      ? response.status(404).json({ success: false, message: 'Clinical report not found' })
      : response.status(500).json({ success: false, message: 'Failed to fetch clinical report', error: clinicalReport.error });
}
