import { findById } from "../../models/Race/findById.js";

export const selectRaceController = async (request, response) => {
  let idRace = request.params.idRace;

  if (isNaN(idRace)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let race = await findById(idRace);

  return race.status
    ? response.status(200).json({ sucess: true, values: [race.values] })
    : race.status === undefined
      ? response.status(404).json({ sucess: false, message: 'Race not found' })
      : response.status(500).json({ sucess: false, message: 'Failed to fetch race', error: race.error });
}
