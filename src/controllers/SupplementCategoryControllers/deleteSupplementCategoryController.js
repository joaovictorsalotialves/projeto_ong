import { remove } from "../../models/SupplementCategory/remove.js";

export const deleteSupplementCategoryController = async (request, response) => {
  let idSupplementCategory = request.params.idSupplementCategory;

  if (isNaN(idSupplementCategory)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  let result = await remove(idSupplementCategory);

  return result.status
    ? response.status(200).json({ sucess: true, message: 'Supplement category deleted successfully' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to deleted supplement category', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
