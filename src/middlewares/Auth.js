import dotenv from 'dotenv';
dotenv.config();

import jwt from "jsonwebtoken";
import { findByEmail as EmployeeFindByEmail } from "../models/Employee/findByEmail.js";

export class Auth {
  auth = async (request) => {
    try {
      const jwtToken = request.headers.authorization;

      let bearer = jwtToken.split(' ');
      let token = bearer[1];

      const decoded = jwt.verify(token, process.env.JWT_SECRET);

      if (!decoded.email) {
        return {
          status: false,
          message: 'Invalid token'
        };
      }

      let employee = await EmployeeFindByEmail(decoded.email);

      return employee.status
        ? { status: true, position: decoded.position }
        : employee.error
          ? { status: false, message: 'failed to check token', error: employee.error }
          : { status: false, message: employee.message };

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
