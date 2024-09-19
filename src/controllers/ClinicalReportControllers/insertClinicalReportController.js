import { create } from "../../models/ClinicalReport/create.js";

export const insertClinicalReportController = async (request, response) => {
  let { descriptionClinicalReport, idEmployee, idAnimal } = request.body;

  if (!descriptionClinicalReport || !idEmployee || !idAnimal) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  let nowDate = new Date();
  let registrationDate = `${nowDate.getUTCFullYear()}-${String(nowDate.getUTCMonth() + 1).padStart(2, '0')}-${String(nowDate.getUTCDate()).padStart(2, '0')}`;

  let result = await create(registrationDate, descriptionClinicalReport, idEmployee, idAnimal);

  return result.status
    ? response.status(200).json({ success: true, id: result.id, message: 'Clinical report successfully registered' })
    : result.error
      ? response.status(500).json({ success: false, message: 'Failed to register clinical report', error: result.error })
      : response.status(400).json({ success: false, message: result.message });
}
