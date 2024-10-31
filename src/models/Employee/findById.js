import { conn } from "../../data/connection.js";
import { findById as AddressFindById } from "../Address/findById.js";

export const findById = async (idEmployee) => {
  try {
    let employee = await conn.select().where({ idEmployee: idEmployee }).table('employees');

    if (employee.length <= 0) return { status: undefined };

    if (employee[0].Addresses_idAddress !== null) {
      let address = await AddressFindById(employee[0].Addresses_idAddress);
      if (address.status && employee.Addresses_idAddress === address.values.idAddresse) {
        employee[0].address = address.values;
      }
    }
    return { status: true, values: employee[0] };
  } catch (error) {
    return { status: false, error: error };
  }
}
