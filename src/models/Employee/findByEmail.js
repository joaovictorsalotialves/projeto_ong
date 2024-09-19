import { conn } from "../../data/connection.js";

export const findByEmail = async (email) => {
  try {
    let employee = await conn.select().where({ email: email }).table('employees');
    return employee.length > 0
      ? { status: true, values: employee[0] }
      : { status: undefined };
  } catch (error) {
    return { status: false, error: error };
  }
}
