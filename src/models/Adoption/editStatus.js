import { conn } from "../../data/connection.js";
import { editStatus as AnimalEditStatus } from "../Animal/editStatus.js";
import { findById } from "./findById.js";

export const editStatus = async (idAdoption, statusAdoption) => {
  let adoption = await findById(idAdoption);

  if (adoption.status) {
    try {
      await conn.update({
        statusAdoption: statusAdoption
      }).where({ idAdoption: idAdoption }).table('adoptions');
      if (statusAdoption == 'Aprovada') {
        await AnimalEditStatus(adoption.values.Animals_idAnimal, 'ADOPTED');
      } else {
        await AnimalEditStatus(adoption.values.Animals_idAnimal, 'AWAITING ADOPTION');
      }
      return { status: true, id: idAdoption };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Not found adoption'
  };
}
