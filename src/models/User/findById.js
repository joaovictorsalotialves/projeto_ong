import { conn } from "../../data/connection.js";
import { findById as AddressFindById } from "../Address/findById.js";

export const findById = async (idUser) => {
  try {
    let user = await conn.select().where({ idUser: idUser }).table('users');

    if (user.length <= 0) return { status: undefined };

    if (user[0].Addresses_idAddress !== null) {
      let address = await AddressFindById(user[0].Addresses_idAddress);
      if (address.status && user.Addresses_idAddress === address.values.idAddresse) {
        user[0].address = address.values;
      }
    }
    return { status: true, values: user[0] };
  } catch (error) {
    return { status: false, error: error };
  }
}
