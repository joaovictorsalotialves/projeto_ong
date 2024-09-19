import { conn } from "../../data/connection.js";

export const findAll = async () => {
  try {
    let addresses = await conn
      .select([
        'addresses.idAddress',
        'addresses.publicPlace',
        'addresses.neigborhood',
        'addresses.number',
        'addresses.complement',
        'states.nameState',
        'cities.nameCity'
      ]).from('addresses')
      .join('states', 'addresses.states_idState', '=', 'states.idState')
      .join('cities', 'addresses.cities_idCity', '=', 'cities.idCity');
    return { status: true, values: addresses };
  } catch (error) {
    return { status: false, error: error };
  }
}
