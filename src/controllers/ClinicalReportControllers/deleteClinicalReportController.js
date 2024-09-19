import { remove } from "../../models/ClinicalReport/remove.js";

export const deleteClinicalReportController = async (request, response) => {
  let idClinicalReport = request.params.idClinicalReport;

  if (isNaN(idClinicalReport)) return response.status(404).json({ success: false, message: 'Incorrect parameter' });

  let result = await remove(idClinicalReport);

  return result.status
    ? response.status(200).json({ success: true, message: 'Clinical report deleted successfully' })
    : result.error
      ? response.status(500).json({ success: false, message: 'Failed to delete clinical report', error: result.error })
      : response.status(400).json({ success: false, message: result.message });
}
