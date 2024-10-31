import { conn } from "../../data/connection.js";

export const findById = async (idAddress) => {
  try {
    let address = await conn
      .select([
        'addresses.idAddress',
        'addresses.publicPlace',
        'addresses.neighborhood',
        'addresses.number',
        'addresses.complement',
        'states.nameState',
        'cities.nameCity'
      ]).from('addresses')
      .join('states', 'addresses.states_idState', '=', 'states.idState')
      .join('cities', 'addresses.cities_idCity', '=', 'cities.idCity')
      .where({ idAddress: idAddress });

    return address.length > 0
      ? { status: true, values: address[0] }
      : { status: undefined };
  } catch (error) {
    return { status: false, error: error };
  }
}
