import { resetPassword } from "../../models/Employee/resetPassword.js";

export const resetPasswordController = async (request, response) => {
  const email = request.headers.email;

  if (email) {
    let { newPassword, passwordCheck, code } = request.body;

    if (!newPassword || !passwordCheck) {
      return response.status(400).json({
        success: false,
        message: 'Bad request: Missing required fields'
      });
    }

    if (newPassword !== passwordCheck) {
      return response.status(400).json({
        sucess: false,
        message: 'Bad request: Incorrect password check'
      });
    }

    let result = await resetPassword(code, email, newPassword);

    return result.status
      ? response.status(200).json({ sucess: true, message: 'Successful password reset' })
      : result.error
        ? response.status(500).json({ sucess: false, message: 'Failed to reset password', error: result.error })
        : response.status(400).json({ sucess: false, message: result.message });
  }

  response.status(500).json({ sucess: false, message: 'Failed to session reset password' })
}
