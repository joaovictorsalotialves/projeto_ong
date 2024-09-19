import { conn } from "../../data/connection.js";

export const findAll = async (nameUser) => {
  try {
    let users = await conn.select([
      'idUser',
      'nameUser',
      'cellPhoneNumber',
      'email'
    ]).where(function () {
      if(nameUser) this.whereRaw("`nameUser` LIKE ? COLLATE utf8mb4_general_ci", [`%${nameUser}%`])
    }).orderBy([{ column: 'nameUser', order: 'asc' }])
    .table('users');
    return { status: true, values: users };
  } catch (error) {
    return { status: false, error: error };
  }
}
