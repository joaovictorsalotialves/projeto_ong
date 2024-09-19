import { conn } from "../../data/connection.js";
import { findById } from "./findById.js";

export const remove = async (idClinicalReport) => {
  let report = await findById(idClinicalReport);

  if (report.status) {
    try {
      await conn.delete().where({ idClinicalReport: idClinicalReport }).table('clinicalreports');
      return { status: true };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Not found clinical report'
  };
}
