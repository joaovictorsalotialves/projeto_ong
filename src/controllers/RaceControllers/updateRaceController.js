import { edit } from "../../models/Race/edit.js";

export const updateRaceController = async (request, response) => {
  let idRace = request.params.idRace;
  let { nameRace } = request.body;
  nameRace = nameRace.toUpperCase();

  if (isNaN(idRace)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  if (!nameRace) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  let result = await edit(idRace, nameRace);

  return result.status
    ? response.status(200).json({ sucess: true, message: 'Race changed successfully' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to changed race', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
