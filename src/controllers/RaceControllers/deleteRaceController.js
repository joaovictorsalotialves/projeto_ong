import { remove } from "../../models/Race/remove.js";

export const deleteRaceController = async (request, response) => {
  let idRace = request.params.idRace;

  if (isNaN(idRace)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let result = await remove(idRace);

  return result.status
    ? response.status(200).json({ sucess: true, message: 'Race deleted successfully' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to deleted race', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
