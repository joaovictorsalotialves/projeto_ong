import { conn } from "../../data/connection.js";

export const findAll = async (nameCity) => {
  try {
    let cities = await conn.select([
      'idCity', 'nameCity'
    ]).where(function () {
      if (nameCity) this.whereRaw("`nameCity` LIKE ? COLLATE utf8mb4_general_ci", [`%${nameCity}%`]);
    }).orderBy([{ column: 'nameCity', order: 'asc' }]).table('cities');
    return { status: true, values: cities };
  } catch (error) {
    return { status: false, error: error };
  }
}
