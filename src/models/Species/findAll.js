import { conn } from "../../data/connection.js";

export const findAll = async (nameSpecies) => {
  try {
    let species = await conn.select()
      .where(function () {
        if (nameSpecies) this.whereRaw("`nameSpecies` LIKE ? COLLATE utf8mb4_general_ci", [`%${nameSpecies}%`]);
      }).orderBy([{ column: 'nameSpecies', order: 'asc' }]).table('species');
    return { status: true, values: species };
  } catch (error) {
    return { status: false, error: error };
  }
}
