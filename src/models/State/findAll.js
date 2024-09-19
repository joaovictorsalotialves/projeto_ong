import { conn } from "../../data/connection.js";

export const findAll = async (nameState) => {
  try {
    let states = await conn.select()
      .where(function () {
        if (nameState) this.whereRaw("`nameState` LIKE ? COLLATE utf8mb4_general_ci", [`%${nameState}%`]);
      }).orderBy([{ column: 'nameState', order: 'asc' }]).table('states');
    return { status: true, values: states };
  } catch (error) {
    return { status: false, error: error };
  }
}
