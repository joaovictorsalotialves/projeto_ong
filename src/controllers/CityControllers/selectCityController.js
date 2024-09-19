import { findById } from "../../models/City/findById.js";

export const selectCityController = async (request, response) => {
  let idCity = request.params.idCity;

  if (isNaN(idCity)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let city = await findById(idCity);

  return city.status
    ? response.status(200).json({ sucess: true, values: city.values })
    : city.status === undefined
      ? response.status(404).json({ sucess: false, message: 'City not found' })
      : response.status(500).json({ sucess: false, message: 'Failed to fetch city', error: city.error });
}
