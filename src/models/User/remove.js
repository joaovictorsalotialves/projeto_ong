import { conn } from "../../data/connection.js";
import { remove as AddressRemove } from "../Address/remove.js";
import { findById } from "./findById.js";

export const remove = async (idUser) => {
  let user = await findById(idUser);

  if (user.status) {
    try {
      await conn.delete().where({ idUser: idUser }).table('users');
      if (user.values.Addresses_idAddress !== null) await AddressRemove(user.values.Addresses_idAddress);
      return { status: true };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Not found user'
  };
}
