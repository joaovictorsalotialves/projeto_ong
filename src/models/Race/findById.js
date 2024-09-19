import { conn } from "../../data/connection.js";

export const findById = async (idRace) => {
  try {
    let race = await conn.select()
      .where({ idRace: idRace })
      .table('races');
    return race.length > 0
      ? { status: true, values: race[0] }
      : { status: undefined };
  } catch (error) {
    return { status: false, error: error };
  }
}
