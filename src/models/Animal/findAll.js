import { conn } from "../../data/connection.js";

export const findAll = async (nameAnimal, statusAnimal, size, nameSpecies, nameRace) => {
  try {
    let animals = await conn
      .select([
        'animals.idAnimal',
        'animals.nameAnimal',
        'animals.size',
        'animals.statusAnimal',
        'animals.description',
        'species.nameSpecies',
        'races.nameRace'
      ]).from('animals')
      .join('species', 'animals.Species_idSpecies', '=', 'species.idSpecies')
      .join('races', 'animals.Races_idRace', '=', 'races.idRace')
      .where(function () {
        if (nameAnimal) this.whereRaw("`nameAnimal` LIKE ? COLLATE utf8mb4_general_ci", [`%${nameAnimal}%`]);
        if (statusAnimal) this.where({ statusAnimal: statusAnimal });
        if (size) this.where({ size: size });
        if (nameSpecies) this.where({ nameSpecies: nameSpecies });
        if (nameRace) this.where({ nameRace: nameRace });
      }).orderBy([{ column: 'nameAnimal', order: 'asc' }, { column: 'statusAnimal', order: 'asc' }]);
    return { status: true, values: animals };
  } catch (error) {
    return { status: false, error: error };
  }
}
