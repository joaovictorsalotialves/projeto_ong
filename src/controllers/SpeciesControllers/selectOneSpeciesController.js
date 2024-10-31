import { findById } from "../../models/Species/findById.js";

export const selectOneSpeciesController = async (request, response) => {
  let idSpecies = request.params.idSpecies;

  if (isNaN(idSpecies)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let species = await findById(idSpecies);

  return species.status
    ? response.status(200).json({ sucess: true, values: [species.values] })
    : species.status === undefined
      ? response.status(404).json({ sucess: false, message: 'Species not found' })
      : response.status(500).json({ sucess: false, message: 'Failed to fetch species', error: species.error });
}
