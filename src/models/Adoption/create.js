import { conn } from "../../data/connection.js";
import { editStatus as AnimalEditStatus } from "../Animal/editStatus.js";
import { findById as AnimalFindById } from "../Animal/findById.js";
import { findById as UserFindById } from "../User/findById.js";

export const create = async (dateAdoption, idAnimal, idUser, statusAdoption) => {
  let animal = await AnimalFindById(idAnimal);
  let user = await UserFindById(idUser);

  if (animal.status && user.status) {
    if (animal.values.statusAnimal == 'ADOPTED') return {
      status: false,
      message: 'Animal has already been adopted'
    }

    try {
      let idAdoption = await conn.insert({
        dateAdoption: dateAdoption,
        statusAdoption: statusAdoption ? statusAdoption : 'Aprovada',
        Animals_idAnimal: idAnimal,
        Users_idUser: idUser
      }).table('adoptions').returning(['idAdoption']);
      await AnimalEditStatus(idAnimal, 'ADOPTED');
      return { status: true, id: idAdoption[0] };
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
        : 'Bad request: Error sending idAnimal and idUser'
  };
}
