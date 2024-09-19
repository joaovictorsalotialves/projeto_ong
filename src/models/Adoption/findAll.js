import { conn } from "../../data/connection.js";

export const findAll = async (nameUser, nameAnimal, dateAdoption) => {
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
      .where(function () {
        if (nameUser) this.whereRaw("`nameUser` LIKE ? COLLATE utf8mb4_general_ci", [`%${nameUser}%`]);
        if (nameAnimal) this.whereRaw("`nameAnimal` LIKE ? COLLATE utf8mb4_general_ci", [`%${nameAnimal}%`]);
        if (dateAdoption) this.where({ dateAdoption: dateAdoption });
      }).orderBy([{ column: 'dateAdoption', order: 'desc' }, { column: 'nameUser', order: 'asc' }]);
    return { status: true, values: adoptions };
  } catch (error) {
    return { status: false, error: error };
  }
}
