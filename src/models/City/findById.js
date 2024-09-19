import { conn } from "../../data/connection.js";

export const findById = async (idCity) => {
  try {
    let city = await conn.select().where({ idCity: idCity }).table('cities');
    return city.length > 0
      ? { status: true, values: city[0] }
      : { status: undefined };
  } catch (error) {
    return { status: false, error: error };
  }
}
