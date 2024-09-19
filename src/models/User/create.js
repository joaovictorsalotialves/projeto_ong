import { conn } from "../../data/connection.js";
import { create as AddressCreate } from "../Address/create.js";

export const create = async (nameUser, cellPhoneNumber, email, address) => {
  if (address !== undefined) {
    let { publicPlace, neighborhood, number, complement, idState, idCity } = address;
    let resultAddress = await AddressCreate(publicPlace, neighborhood, number, complement, idState, idCity);

    if (resultAddress.status) {
      try {
        let idUser = await conn.insert({
          nameUser: nameUser,
          cellPhoneNumber: cellPhoneNumber,
          email: email,
          Addresses_idAddress: resultAddress.id
        }).table('users').returning(['idUser']);
        return { status: true, id: idUser[0] };
      } catch (error) {
        await Address.remove(resultAddress.id);
        return { status: false, error: error };
      }
    }

    return { ...resultAddress };
  }

  try {
    let idUser = await conn.insert({
      nameUser: nameUser,
      cellPhoneNumber: cellPhoneNumber,
      email: email
    }).table('users').returning(['idUser']);
    return { status: true, id: idUser[0] };
  } catch (error) {
    return { status: false, error: error };
  }
}
