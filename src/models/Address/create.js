import { conn } from "../../data/connection.js";
import { findById as CityFindById } from "../City/findById.js";
import { findById as StateFindById } from "../State/findById.js";

export const create = async (publicPlace, neighborhood, number, complement, idState, idCity) => {
  let state = await StateFindById(idState);
  let city = await CityFindById(idCity);

  if (state.status && city.status) {
    if (city.values.States_idState !== state.values.idState) return {
      status: false,
      message: 'Bad request: The selected city does not belong to the selected state'
    };

    try {
      let idAddress = await conn.insert({
        publicPlace: publicPlace,
        neighborhood: neighborhood,
        number: number,
        complement: complement,
        states_idState: idState,
        cities_idCity: idCity
      }).table('addresses').returning(['idAddress']);
      return { status: true, id: idAddress[0] };
    } catch (error) {
      return { status: false, error: error };
    }
  }

  return {
    status: false,
    message: state.status
      ? 'Bad request: Invalid city ID'
      : city.status
        ? 'Bad request: Invalid state ID'
        : 'Bad request: Error sending idState and idCity'
  };
}
