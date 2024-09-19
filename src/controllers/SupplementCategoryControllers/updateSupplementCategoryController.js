import { edit } from "../../models/SupplementCategory/edit.js";

export const updateSupplementCategoryController = async (request, response) => {
  let idSupplementCategory = request.params.idSupplementCategory;
  let { nameSupplementCategory } = request.body;
  nameSupplementCategory = nameSupplementCategory.toUpperCase();

  if (isNaN(idSupplementCategory)) return response.status(404).json({ sucess: false, message: 'Incorrect parameter' });

  if (!nameSupplementCategory) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  let result = await edit(idSupplementCategory, nameSupplementCategory);

  return result.status
    ? response.status(200).json({ sucess: true, message: 'Supplement category changed successfully' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to changed supplement category', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
