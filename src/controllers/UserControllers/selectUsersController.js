import { findAll } from "../../models/User/findAll.js";

export const selectUsersController = async (request, response) => {
  let { nameUser } = request.query;

  let users = await findAll(nameUser);

  return users.status
    ? response.status(200).json({ sucess: true, values: users.values })
    : response.status(500).json({ sucess: false, messagem: 'Failed to fetch users', error: users.error });
}
