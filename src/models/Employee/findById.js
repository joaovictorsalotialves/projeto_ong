import { conn } from "../../data/connection.js";

export const findById = async (idEmployee) => {
  try {
    let employee = await conn.select()
      .leftJoin('addresses', 'employees.Addresses_idAddress', '=', 'addresses.idAddress')
      .where({ idEmployee: idEmployee }).table('employees');
    return employee.length > 0
      ? { status: true, values: employee[0] }
      : { status: undefined };
  } catch (error) {
    return { status: false, error: error };
  }
}
