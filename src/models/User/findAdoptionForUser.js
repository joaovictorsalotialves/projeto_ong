import { conn } from "../../data/connection.js";
import { findById } from "./findById.js";

export const findAdoptionForUser = async (idUser, dateAdoption) => {
  const user = await findById(idUser);

  if (user.status) {
    try {
      let adoptions = await conn.select([
        'adoptions.idAdoption',
        'adoptions.dateAdoption',
        'adoptions.statusAdoption',
        'animals.idAnimal',
        'animals.nameAnimal',
        'users.idUser',
        'users.nameUser'
      ]).from('adoptions')
        .join('animals', 'adoptions.Animals_idAnimal', '=', 'animals.idAnimal')
        .join('users', 'adoptions.Users_idUser', '=', 'users.idUser')
        .where({ idUser: idUser })
        .where(function () {
          if (dateAdoption) this.where({ dateAdoption: dateAdoption });
        }).orderBy([{ column: 'dateAdoption', order: 'desc' }]);
      return { status: true, values: adoptions };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Not found user'
  };
}
