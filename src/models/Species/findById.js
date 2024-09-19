import { conn } from "../../data/connection.js";

export const findById = async (idSpecies) => {
  try {
    let species = await conn.select()
      .where({ idSpecies: idSpecies })
      .table('species');
    return species.length > 0
      ? { status: true, values: species[0] }
      : { status: undefined };
  } catch (error) {
    return { status: false, error: error };
  }
}
