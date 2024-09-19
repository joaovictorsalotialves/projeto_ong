import { create } from "../../models/Race/create.js";

export const insertRaceController = async (request, response) => {
  let { nameRace } = request.body;
  nameRace = nameRace.toUpperCase();

  if (!nameRace) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  let result = await create(nameRace);

  return result.status
    ? response.status(200).json({ sucess: true, id: result.id, message: 'Race successfully registered' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to registered race', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
