import dotenv from 'dotenv';
dotenv.config();

import express from "express";
import session from "express-session";

import { Auth } from "./middlewares/Auth.js";

import { cityRouters } from "./routers/cityRouters.js";
import { stateRouters } from "./routers/stateRouters.js";

import { employeeRouters } from "./routers/employeeRouters.js";
import { userRouters } from "./routers/userRouters.js";

import { donationCategoryRouters } from "./routers/donationCategoryRouters.js";
import { donationRouters } from "./routers/donationRouters.js";

import { expenseCategoryRouters } from "./routers/expenseCategoryRouters.js";
import { expenseRouters } from "./routers/expenseRouters.js";

import { animalRouters } from "./routers/animalRouters.js";
import { raceRouters } from "./routers/raceRouters.js";
import { speciesRouters } from "./routers/speciesRouters.js";

import { adoptionRouters } from "./routers/adoptionRouters.js";
import { clinicalReportRouters } from "./routers/clinicalReportRouters.js";

import { supplementCategoryRouters } from "./routers/supplementCategoryRouters.js";
import { supplementInputRouters } from "./routers/supplementInputRouters.js";
import { supplementOutputRouters } from "./routers/supplementOutputRouters.js";
import { supplementRouters } from "./routers/supplementRouters.js";

export const api = express();

const auth = new Auth;

api.use(express.urlencoded({ extended: false }));
api.use(express.json());

api.use(session({
  secret: process.env.SESSION_SECRET,
  resave: false,
  saveUninitialized: true,
  cookie: { secure: false }
}));

api.use('/city', cityRouters);
api.use('/state', stateRouters);
// api.use('/address', addressRouters);

api.use('/user', userRouters);
api.use('/employee', employeeRouters);

api.use('/donation-category', donationCategoryRouters);
api.use('/donation', donationRouters);

api.use('/expense-category', expenseCategoryRouters);
api.use('/expense', expenseRouters);

api.use('/animal', animalRouters);
api.use('/race', raceRouters);
api.use('/species', speciesRouters);

api.use('/adoption', adoptionRouters);
api.use('/clinical-report', clinicalReportRouters);

api.use('/supplement-category', supplementCategoryRouters);
api.use('/supplement-input', supplementInputRouters);
api.use('/supplement-output', supplementOutputRouters);
api.use('/supplement', supplementRouters);
