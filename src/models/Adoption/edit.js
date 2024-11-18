import { conn } from "../../data/connection.js";
import { editStatus as AnimalEditStatus } from "../Animal/editStatus.js";
import { findById as AnimalFindById } from "../Animal/findById.js";
import { findById as UserFindById } from "../User/findById.js";
import { findById } from "./findById.js";

export const edit = async (idAdoption, idAnimal, idUser, statusAdoption) => {
  let adoption = await findById(idAdoption);

  if (adoption.status) {
    let animal = await AnimalFindById(idAnimal);
    let user = await UserFindById(idUser);

    if (animal.status && user.status) {
      if (animal.values.statusAnimal == 'ADOPTION') {
        if (adoption.values.Animals_idAnimal != animal.values.idAnimal) return {
          status: false,
          message: 'Animal has already been adopted'
        }
      }

      if (adoption.values.idAnimal != idAnimal) {
        await AnimalEditStatus(adoption.values.idAnimal, 'AWAITING ADOPTION');
      }

      try {
        await conn.update({
          Animals_idAnimal: idAnimal,
          Users_idUser: idUser,
          statusAdoption: statusAdoption
        }).where({ idAdoption: idAdoption }).table('adoptions');
        return { status: true, id: idAdoption };
      } catch (error) {
        return { status: false, error: error };
      }
    }

    return {
      status: false,
      message: animal.status
        ? 'Bad request: Invalid user ID'
        : user.status
          ? 'Bad request: Invalid animal ID'
          : 'Bad request: Error sending idAnimal or idUser'
    };
  }

  return {
    status: false,
    message: 'Bad request: Not found adoption'
  };
}
