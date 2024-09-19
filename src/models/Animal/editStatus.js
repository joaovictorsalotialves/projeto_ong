import { conn } from "../../data/connection.js";
import { findById } from "./findById.js";

export const editStatus = async (idAnimal, statusAnimal) => {
  let animal = await findById(idAnimal);

  if (animal.status) {
    try {
      await conn.update({
        statusAnimal: statusAnimal
      }).where({ idAnimal: idAnimal }).table('animals');
      return { status: true, id: idAnimal };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: 'Bad request: Not found animal'
  };
}
