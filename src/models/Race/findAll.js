import { conn } from "../../data/connection.js";

export const findAll = async (nameRace) => {
  try {
    let races = await conn.select()
      .where(function () {
        if (nameRace) this.whereRaw("`nameRace` LIKE ? COLLATE utf8mb4_general_ci", [`%${nameRace}%`]);
      }).orderBy([{ column: 'nameRace', order: 'asc' }]).table('races');
    return { status: true, values: races };
  } catch (error) {
    return { status: false, error: error };
  }
}
