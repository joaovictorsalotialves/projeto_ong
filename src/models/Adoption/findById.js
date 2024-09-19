import { conn } from "../../data/connection.js";

export const findById = async (idAdoption) => {
  try {
    let adoption = await conn
      .select().from('adoptions')
      .join('animals', 'adoptions.Animals_idAnimal', '=', 'animals.idAnimal')
      .join('users', 'adoptions.Users_idUser', '=', 'users.idUser')
      .where({ idAdoption: idAdoption });
    return adoption.length > 0
      ? { status: true, values: adoption[0] }
      : { status: undefined };
  } catch (error) {
    return { status: false, error: error };
  }
}
