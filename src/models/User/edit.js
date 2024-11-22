import { conn } from "../../data/connection.js";
import { create as AddressCreate } from "../Address/create.js";
import { edit as AddressEdit } from "../Address/edit.js";
import { findById } from "./findById.js";
import { removeAddress } from "./removeAddress.js";

export const edit = async (idUser, nameUser, cellPhoneNumber, email, address) => {
  let user = await findById(idUser);
  if (user.status) {
    if (address !== undefined) {
      let { publicPlace, neighborhood, number, complement, idState, idCity } = address;
      let resultAddress;
      if (user.values.Addresses_idAddress) {
        resultAddress = await AddressEdit(user.values.Addresses_idAddress, publicPlace, neighborhood, number, complement, idState, idCity);
      } else {
        resultAddress = await AddressCreate(publicPlace, neighborhood, number, complement, idState, idCity);
      }

      if (resultAddress.status) {
        try {
          await conn.update({
            nameUser: nameUser,
            cellPhoneNumber: cellPhoneNumber,
            email: email,
            Addresses_idAddress: user.values.Addresses_idAddress || resultAddress.id
          }).where({ idUser: idUser }).table('users');
          return { status: true };
        } catch (error) {
          return { status: false, error: error };
        }
      }

      return { ...resultAddress };
    }

    if (user.values.Addresses_idAddress) {
      await removeAddress(user.values.idUser);
    }
    try {
      await conn.update({
        nameUser: nameUser,
        cellPhoneNumber: cellPhoneNumber,
        email: email
      }).where({ idUser: idUser }).table('users');
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
