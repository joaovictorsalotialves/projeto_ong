import { findAll } from "../../models/state/findAll.js";

export const selectStatesController = async (request, response) => {
  let { nameState } = request.query;

  let states = await findAll(nameState);

  return states.status
    ? response.status(200).json({ sucess: true, values: states.values })
    : response.status(500).json({ sucess: false, messagem: 'Failed to fetch states', error: states.error });
}
