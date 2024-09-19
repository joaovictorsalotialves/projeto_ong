import { conn } from "../../data/connection.js";
import { findById as CityFindById } from "../City/findById.js";
import { findById as StateFindById } from "../State/findById.js";
import { findById } from "./findById.js";

export const edit = async (idAddress, publicPlace, neighborhood, number, complement, idState, idCity) => {
  let address = await findById(idAddress);

  if (address.status) {
    let state = await StateFindById(idState);
    let city = await CityFindById(idCity);

    if (city.values.States_idState !== state.values.idState) return {
      status: false,
      message: 'Bad request: The selected city does not belong to the selected state'
    };

    if (state.status && city.status) {
      try {
        await conn.update({
          publicPlace: publicPlace,
          neighborhood: neighborhood,
          number: number,
          complement: complement,
          states_idState: idState,
          cities_idCity: idCity
        }).where({ idAddress: idAddress }).table('addresses');
        return { status: true, id: idAddress };
      } catch (error) {
        return { status: false, error: error };
      }
    }

    return {
      status: false,
      message: state.status
        ? "Bad request: Invalid city ID"
        : city.status
          ? "Bad request: Invalid state ID"
          : 'Bad request: Error sending idState or idCity'
    };
  }

  return {
    status: false,
    message: 'Bad request: Not found address'
  };
}
