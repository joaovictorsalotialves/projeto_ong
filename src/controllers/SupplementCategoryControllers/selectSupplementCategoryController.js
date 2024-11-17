import { findById } from "../../models/SupplementCategory/findById.js";

export const selectSupplementCategoryController = async (request, response) => {
  let idSupplementCategory = request.params.idSupplementCategory;

  if (isNaN(idSupplementCategory)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let supplementCategory = await findById(idSupplementCategory);

  return supplementCategory.status
    ? response.status(200).json({ sucess: true, values: supplementCategory.values })
    : supplementCategory.status === undefined
      ? response.status(404).json({ sucess: false, message: 'Supplement category not found' })
      : response.status(500).json({ sucess: false, message: 'Failed to fetch supplement category', error: supplementCategory.error });
}
