import dotenv from 'dotenv';
dotenv.config();

import jwt from "jsonwebtoken";
import { findByEmail as EmployeeFindByEmail } from "../models/Employee/findByEmail.js";

export class Auth {
  auth = async (request) => {
    try {
      const authToken = request.session.validationToken;
      const jwtToken = request.headers.authorization;

      if (authToken && jwtToken) {
        let bearer = jwtToken.split(' ');
        let token = bearer[1];

        if (authToken != token) return { status: false, message: 'jwt token is not compatible with the session token' }

        const decoded = jwt.verify(token, process.env.JWT_SECRET);

        if (!decoded.email) {
          return {
            status: false,
            message: 'Invalid token'
          };
        }

        let employee = await EmployeeFindByEmail(decoded.email);

        if (authToken !== employee.values.validationToken) {
          return { status: false, message: 'Bad request: This session does not belong to this employee' };
        }

        return employee.status
          ? { status: true, position: decoded.position }
          : employee.error
            ? { status: false, message: 'failed to check token', error: employee.error }
            : { status: false, message: employee.message };
      }

      return authToken === undefined
        ? { status: undefined }
        : { status: false };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  authAdmin = async (request, response, next) => {
    let result = await this.auth(request);

    return result.status
      ? result.position == 'admin'
        ? next()
        : response.status(403).json({ success: false, message: 'Unauthenticated' })
      : result.status === undefined
        ? response.status(401).json({ success: false, message: 'Unauthenticated' })
        : result.error
          ? response.status(500).json({ success: false, message: 'Authentication failure', error: result.error })
          : result.message
            ? response.status(400).json({ success: false, message: result.message })
            : response.status(500).json({ success: false, message: 'Authentication failure' });
  };

  authVeterinarion = async (request, response, next) => {
    let result = await this.auth(request);

    return result.status
      ? result.position == 'veterinarion'
        ? next()
        : response.status(403).json({ success: false, message: 'Unauthenticated' })
      : result.status === undefined
        ? response.status(401).json({ success: false, message: 'Unauthenticated' })
        : result.error
          ? response.status(500).json({ success: false, message: 'Authentication failure', error: result.error })
          : result.message
            ? response.status(400).json({ success: false, message: result.message })
            : response.status(500).json({ success: false, message: 'Authentication failure' });
  }

  authEmployee = async (request, response, next) => {
    let result = await this.auth(request);

    return result.status
      ? result.position
        ? next()
        : response.status(403).json({ success: false, message: 'Unauthenticated' })
      : result.status === undefined
        ? response.status(401).json({ success: false, message: 'Unauthenticated' })
        : result.error
          ? response.status(500).json({ success: false, message: 'Authentication failure', error: result.error })
          : result.message
            ? response.status(400).json({ success: false, message: result.message })
            : response.status(500).json({ success: false, message: 'Authentication failure' });
  }
}
