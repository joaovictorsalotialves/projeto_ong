import { conn } from "../../data/connection.js";
import { findById } from "./findById.js";

export const remove = async (idAnimal) => {
  let animal = await findById(idAnimal);

  if (animal.status) {
    try {
      await conn.delete().where({ idAnimal: idAnimal }).table('animals');
      return { status: true };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Not found animal'
  };
}
