import { findByIdState } from "../../models/City/findByIdState.js";

export const selectCityForStateController = async (request, response) => {
  let idState = request.params.idState;
  let { nameCity } = request.query;

  if (isNaN(idState)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let cities = await findByIdState(idState, nameCity);

  return cities.status
    ? response.status(200).json({ sucess: true, values: cities.values })
    : cities.status === undefined
      ? response.status(404).json({ sucess: false, message: 'Cities not found' })
      : cities.error
        ? response.status(500).json({ sucess: false, message: 'Failed to fetch cities', error: cities.error })
        : response.status(400).json({ sucess: false, message: cities.message });
}
