import { edit } from "../../models/ClinicalReport/edit.js";

export const updateClinicalReportController = async (request, response) => {
  let idClinicalReport = request.params.idClinicalReport;
  let { descriptionClinicalReport } = request.body;

  if (isNaN(idClinicalReport)) return response.status(404).json({ success: false, message: 'Incorrect parameter' });

  if (!descriptionClinicalReport) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  let nowDate = new Date();
  let editionDate = `${nowDate.getUTCFullYear()}-${String(nowDate.getUTCMonth() + 1).padStart(2, '0')}-${String(nowDate.getUTCDate()).padStart(2, '0')}`;

  let result = await edit(idClinicalReport, editionDate, descriptionClinicalReport);

  return result.status
    ? response.status(200).json({ success: true, message: 'Clinical report updated successfully' })
    : result.error
      ? response.status(500).json({ success: false, message: 'Failed to update clinical report', error: result.error })
      : response.status(400).json({ success: false, message: result.message });
}
