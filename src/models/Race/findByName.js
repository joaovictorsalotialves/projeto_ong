import { conn } from "../../data/connection.js";

export const findByName = async (nameRace) => {
  try {
    let race = await conn.select()
      .where({ nameRace: nameRace })
      .table('races');
    return race.length > 0
      ? { status: true, values: race[0] }
      : { status: undefined };
  } catch (error) {
    return { status: false, error: error };
  }
}
