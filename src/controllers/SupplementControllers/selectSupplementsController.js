import { findAll } from "../../models/Supplement/findAll.js";

export const selectSupplementsController = async (request, response) => {
  let { nameSupplement, nameSupplementCategory, typeMensure } = request.query;

  let supplements = await findAll(nameSupplement, nameSupplementCategory, typeMensure);

  return supplements.status
    ? response.status(200).json({ sucess: true, values: supplements.values })
    : response.status(500).json({ sucess: false, messagem: 'Failed to fetch supplements', error: supplements.error });
}
