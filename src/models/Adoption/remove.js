import { conn } from "../../data/connection.js";
import { editStatus as AnimalEditStatus } from "../Animal/editStatus.js";
import { findById } from "./findById.js";

export const remove = async (idAdoption) => {
  let adoption = await findById(idAdoption);

  if (adoption.status) {
    try {
      await conn.delete().where({ idAdoption: idAdoption }).table('adoptions');
      await AnimalEditStatus(adoption.values.idAnimal, 'AWAITING ADOPTION');
      return { status: true };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Not found adoption'
  };
}
