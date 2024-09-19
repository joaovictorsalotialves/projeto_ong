import { findAll } from "../../models/City/findAll.js";

export const selectCitiesController = async (request, response) => {
  let { nameCity } = request.query;

  let cities = await findAll(nameCity);

  return cities.status
    ? response.status(200).json({ sucess: true, values: cities.values })
    : response.status(500).json({ sucess: false, messagem: 'Failed to fetch cities', error: cities.error });
}
