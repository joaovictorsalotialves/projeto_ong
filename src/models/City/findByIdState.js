import { conn } from "../../data/connection.js";
import { findById as StateFindById } from "../State/findById.js";

export const findByIdState = async (idState, nameCity) => {
  let state = await StateFindById(idState);

  if (!state.status) return { ...state };

  try {
    let cities = await conn.select(['idCity', 'nameCity'])
      .where({ States_idState: idState })
      .where(function () {
        if (nameCity) this.whereRaw("`nameCity` LIKE ? COLLATE utf8mb4_general_ci", [`%${nameCity}%`]);
      })
      .orderBy([{ column: 'nameCity', order: 'asc' }]).table('cities');
    return { status: true, values: cities };
  } catch (error) {
    return { status: false, error: error };
  }
}
