import { conn } from "../../data/connection.js";

import { findById } from "./findById.js";

export const edit = async (idClinicalReport, editionDate, descriptionClinicalReport) => {
  let report = await findById(idClinicalReport);

  if (report.status) {
    try {
      await conn('clinicalreports').update({
        editionDate: editionDate,
        descriptionClinicalReport: descriptionClinicalReport,
      }).where({ idClinicalReport: idClinicalReport });
      return { status: true, id: idClinicalReport };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Not found clinical report'
  };
}
