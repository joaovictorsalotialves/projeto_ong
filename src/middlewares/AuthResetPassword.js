import dotenv from "dotenv";
dotenv.config();

import jwt from "jsonwebtoken";

export const authResetPassword = (request, response, next) => {
  const authToken = request.headers.authorization;

  if (!authToken) return response.status(403).json({ sucess: false, message: 'Unauthenticated' });

  let bearer = authToken.split(' ');
  let token = bearer[1];

  try {
    let decoded = jwt.verify(token, process.env.JWT_SECRET);
    let code = request.body.code;

    if (decoded.authCode == code) {
      request.session.email = decoded.email;
      return next();
    }

    return response.status(403).json({ sucess: false, message: 'Invalid code!' });
  } catch (error) {
    return response.status(500).json({ sucess: false, message: 'Unauthenticated', error: error });
  }
}
