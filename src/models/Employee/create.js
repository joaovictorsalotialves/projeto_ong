import bcrypt from "bcryptjs";

import { conn } from "../../data/connection.js";
import { create as AddressCreate } from "../Address/create.js";
import { findByEmail } from "./findByEmail.js";

export const create = async (nameEmployee, cellPhoneNumber, email, password, position, address) => {
  let employee = await findByEmail(email);

  if (employee.status) return {
    status: false,
    message: 'Bad request: Email already registered'
  };

  let salt = bcrypt.genSaltSync(10);
  let hash = bcrypt.hashSync(password, salt);

  if (address !== undefined) {
    let { publicPlace, neighborhood, number, complement, idState, idCity } = address;
    let resultAddress = await AddressCreate(publicPlace, neighborhood, number, complement, idState, idCity);

    if (resultAddress.status) {
      try {
        let idEmployee = await conn.insert({
          nameEmployee: nameEmployee,
          email: email,
          cellPhoneNumber: cellPhoneNumber,
          passwordHash: hash,
          position: position,
          Addresses_idAddress: resultAddress.id
        }).table('employees').returning(['idEmployee']);
        return { status: true, id: idEmployee[0] };
      } catch (error) {
        await Address.remove(resultAddress.id);
        return { status: false, error: error };
      }
    }
    return { ...resultAddress };
  }

  try {
    let idEmployee = await knex.insert({
      nameEmployee: nameEmployee,
      email: email,
      cellPhoneNumber: cellPhoneNumber,
      passwordHash: hash,
      position: position
    }).table('employees').returning(['idEmployee']);
    return { status: true, id: idEmployee[0] };
  } catch (error) {
    return { status: false, error: error };
  }
}
