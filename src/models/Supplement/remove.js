import { conn } from "../../data/connection.js";
import { findById } from "./findById.js";

export const remove = async (idSupplement) => {
  let supplement = await findById(idSupplement);

  if (supplement.status) {
    try {
      await conn.delete().where({ idSupplement: idSupplement }).table('supplements');
      return { status: true };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Not found supplement'
  };
}
