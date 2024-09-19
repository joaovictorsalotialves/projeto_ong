import { conn } from "../../data/connection.js";
import { findById } from "./findById.js";

export const editStock = async (idSupplement, amount) => {
  let supplement = await findById(idSupplement);

  if (supplement.status) {
    let newStock = supplement.values.stock + amount;

    try {
      await conn.update({
        stock: newStock
      }).where({ idSupplement: idSupplement }).table('supplements');
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
