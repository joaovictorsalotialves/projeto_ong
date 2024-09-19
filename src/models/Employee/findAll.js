import { conn } from "../../data/connection.js";

export const findAll = async (nameEmployee, position) => {
  try {
    let employees = await conn.select([
      'idEmployee',
      'nameEmployee',
      'cellPhoneNumber',
      'email',
      'position'
    ]).where(function () {
      if (nameEmployee) this.whereRaw("`nameEmployee` LIKE ? COLLATE utf8mb4_general_ci", [`%${nameEmployee}%`]);
      if (position) this.where({ position: position });
    }).orderBy([{ column: 'nameEmployee', order: 'asc' }]).table('employees');
    return { status: true, values: employees };
  } catch (error) {
    return { status: false, error: error };
  }
}
