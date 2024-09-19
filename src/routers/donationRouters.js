import express from "express";

import { deleteDonationController } from "../controllers/DonationControllers/deleteDonationController.js";
import { insertDonationController } from "../controllers/DonationControllers/insertDonationController.js";
import { selectDonationController } from "../controllers/DonationControllers/selectDonationController.js";
import { selectDonationsController } from "../controllers/DonationControllers/selectDonationsController.js";
import { updateDonationController } from "../controllers/DonationControllers/updateDonationController.js";


export const donationRouters = express.Router();

donationRouters.post('/', insertDonationController);

donationRouters.put('/:idDonation', updateDonationController);

donationRouters.get('/', selectDonationsController);
donationRouters.get('/:idDonation', selectDonationController);

donationRouters.delete('/:idDonation', deleteDonationController);
