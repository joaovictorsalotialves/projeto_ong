import { findAll } from "../../models/Race/findAll.js";

export const selectRacesController = async (request, response) => {
  let { nameRace } = request.query;

  let races = await findAll(nameRace);

  return races.status
    ? response.status(200).json({ sucess: true, values: races.values })
    : response.status(500).json({ sucess: false, messagem: 'Failed to fetch races', error: races.error });
}
