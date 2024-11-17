import { findById } from "../../models/State/findById.js";

export const selectStateController = async (request, response) => {
  let idState = request.params.idState;

  if (isNaN(idState)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let state = await findById(idState);

  return state.status
    ? response.status(200).json({ sucess: true, values: state.values })
    : state.status === undefined
      ? response.status(404).json({ sucess: false, message: 'State not found' })
      : response.status(500).json({ sucess: false, message: 'Failed to fetch state', error: state.error });
}
