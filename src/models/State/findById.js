import { conn } from "../../data/connection.js";

export const findById = async (idState) => {
  try {
    let state = await conn.select().where({ idState: idState }).table('states');
    return state.length > 0
      ? { status: true, values: state[0] }
      : { status: undefined };
  } catch (error) {
    return { status: false, error: error };
  }
}
