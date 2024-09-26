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

api.use('/city', auth.authEmployee, cityRouters);
api.use('/state', auth.authEmployee, stateRouters);

api.use('/user', userRouters);
api.use('/employee', employeeRouters);

api.use('/donation-category', auth.authEmployee, donationCategoryRouters);
api.use('/donation', auth.authEmployee, donationRouters);

api.use('/expense-category', auth.authEmployee, expenseCategoryRouters);
api.use('/expense', auth.authEmployee, expenseRouters);

api.use('/animal', auth.authEmployee, animalRouters);
api.use('/race', auth.authEmployee, raceRouters);
api.use('/species', auth.authEmployee, speciesRouters);

api.use('/adoption', auth.authEmployee, adoptionRouters);
api.use('/clinical-report', auth.authEmployee, clinicalReportRouters);

api.use('/supplement-category', auth.authEmployee, supplementCategoryRouters);
api.use('/supplement-input', auth.authEmployee, supplementInputRouters);
api.use('/supplement-output', auth.authEmployee, supplementOutputRouters);
api.use('/supplement', auth.authEmployee, supplementRouters);
