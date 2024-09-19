import { findAll } from "../../models/SupplementCategory/findAll.js";

export const selectSupplementCategoriesController = async (request, response) => {
  let supplementCategories = await findAll();

  return supplementCategories.status
    ? response.status(200).json({ sucess: true, values: supplementCategories.values })
    : response.status(500).json({ sucess: false, messagem: 'Failed to fetch supplement categories', error: supplementCategories.error });
}
