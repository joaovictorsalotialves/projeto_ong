import express from "express";

import { deleteClinicalReportController } from "../controllers/ClinicalReportControllers/deleteClinicalReportController.js";
import { insertClinicalReportController } from "../controllers/ClinicalReportControllers/insertClinicalReportController.js";
import { selectClinicalReportController } from "../controllers/ClinicalReportControllers/selectClinicalReportController.js";
import { selectClinicalReportsController } from "../controllers/ClinicalReportControllers/selectClinicalReportsController.js";
import { updateClinicalReportController } from "../controllers/ClinicalReportControllers/updateClinicalReportController.js";

export const clinicalReportRouters = express.Router();

clinicalReportRouters.post('/', insertClinicalReportController);

clinicalReportRouters.put('/:idClinicalReport', updateClinicalReportController);

clinicalReportRouters.get('/', selectClinicalReportsController);
clinicalReportRouters.get('/:idClinicalReport', selectClinicalReportController);

clinicalReportRouters.delete('/:idClinicalReport', deleteClinicalReportController);
