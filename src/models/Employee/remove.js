import { conn } from "../../data/connection.js";
import { remove as AddressRemove } from "../Address/remove.js";
import { findById } from "./findById.js";

export const remove = async (idEmployee) => {
  let employee = await findById(idEmployee);

  if (employee.status) {
    try {
      await conn.delete().where({ idEmployee: idEmployee }).table('employees');
      if (employee.values.Addresses_idAddress !== null) await AddressRemove(employee.values.Addresses_idAddress);
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
