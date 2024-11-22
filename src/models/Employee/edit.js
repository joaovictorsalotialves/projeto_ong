import { conn } from "../../data/connection.js";
import { create as AddressCreate } from "../Address/create.js";
import { edit as AddressEdit } from "../Address/edit.js";
import { findByEmail } from "./findByEmail.js";
import { findById } from "./findById.js";
import { removeAddress } from "./removeAddress.js";

export const edit = async (idEmployee, nameEmployee, cellPhoneNumber, email, position, address) => {
  let employee = await findById(idEmployee);
  let emailVerification = await findByEmail(email);

  if (employee.status) {
    if (emailVerification.status) {
      if (emailVerification.values.idEmployee != idEmployee) return {
        status: false,
        message: 'Bad request: Email already registered'
      };
    }

    if (address !== undefined) {
      let { publicPlace, neighborhood, number, complement, idState, idCity } = address;
      let resultAddress;
      if (employee.values.Addresses_idAddress) {
        resultAddress = await AddressEdit(employee.values.Addresses_idAddress, publicPlace, neighborhood, number, complement, idState, idCity);
      } else {
        resultAddress = await AddressCreate(publicPlace, neighborhood, number, complement, idState, idCity);
      }

      if (resultAddress.status) {
        try {
          await conn.update({
            nameEmployee: nameEmployee,
            email: email,
            cellPhoneNumber: cellPhoneNumber,
            position: position,
            Addresses_idAddress: employee.values.Addresses_idAddress || resultAddress.id
          }).where({ idEmployee: idEmployee }).table('employees');
          return { status: true };
        } catch (error) {
          return { status: false, error: error };
        }
      }
      return { ...resultAddress };
    }

    if (employee.values.Addresses_idAddress) {
      await removeAddress(employee.values.idEmployee);
    }
    try {
      await conn.update({
        nameEmployee: nameEmployee,
        email: email,
        cellPhoneNumber: cellPhoneNumber,
        position: position,
      }).where({ idEmployee: idEmployee }).table('employees');
      return { status: true };
    } catch (error) {
      return { status: false, error: error };
    }
  }
  return {
    status: false,
    message: 'Bad request: Not found employee'
  };
}
