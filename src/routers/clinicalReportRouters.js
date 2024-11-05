import express from "express";

import { Auth } from "../middlewares/Auth.js";

import { deleteClinicalReportController } from "../controllers/ClinicalReportControllers/deleteClinicalReportController.js";
import { insertClinicalReportController } from "../controllers/ClinicalReportControllers/insertClinicalReportController.js";
import { selectClinicalReportController } from "../controllers/ClinicalReportControllers/selectClinicalReportController.js";
import { selectClinicalReportsController } from "../controllers/ClinicalReportControllers/selectClinicalReportsController.js";
import { updateClinicalReportController } from "../controllers/ClinicalReportControllers/updateClinicalReportController.js";

export const clinicalReportRouters = express.Router();

const auth = new Auth();

// clinicalReportRouters.post('/', auth.authVeterinarion, insertClinicalReportController);

// clinicalReportRouters.put('/:idClinicalReport', auth.authVeterinarion, updateClinicalReportController);

// clinicalReportRouters.get('/', selectClinicalReportsController);
// clinicalReportRouters.get('/:idClinicalReport', selectClinicalReportController);

// clinicalReportRouters.delete('/:idClinicalReport', auth.authVeterinarion, deleteClinicalReportController);

clinicalReportRouters.post('/', insertClinicalReportController);

clinicalReportRouters.put('/:idClinicalReport', updateClinicalReportController);

clinicalReportRouters.get('/', selectClinicalReportsController);
clinicalReportRouters.get('/:idClinicalReport', selectClinicalReportController);

clinicalReportRouters.delete('/:idClinicalReport', deleteClinicalReportController);
