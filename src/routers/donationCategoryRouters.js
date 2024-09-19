import express from "express";
import { insertDonationCategoryController } from "../controllers/DonationCategoryControllers/insertDonationCategoryController.js";
import { updateDonationCategoryController } from "../controllers/DonationCategoryControllers/updateDonationCategoryController.js";
import { selectDonationCategoriesController } from "../controllers/DonationCategoryControllers/selectDonationCategoriesController.js";
import { selectDonationCategoryController } from "../controllers/DonationCategoryControllers/selectDonationCategoryController.js";
import { deleteDonationCategoryController } from "../controllers/DonationCategoryControllers/deleteDonationCategoryController.js";

export const donationCategoryRouters = express.Router();

donationCategoryRouters.post('/', insertDonationCategoryController);

donationCategoryRouters.put('/:idDonationCategory', updateDonationCategoryController);

donationCategoryRouters.get('/', selectDonationCategoriesController);
donationCategoryRouters.get('/:idDonationCategory', selectDonationCategoryController);

donationCategoryRouters.delete('/:idDonationCategory', deleteDonationCategoryController);
