import { conn } from "../../data/connection.js";

export const findByName = async (nameSpecies) => {
  try {
    let species = await conn.select()
      .where({ nameSpecies: nameSpecies })
      .table('species');
    return species.length > 0
      ? { status: true, values: species[0] }
      : { status: undefined };
  } catch (error) {
    return { status: false, error: error };
  }
}
