import { create } from "../../models/SupplementCategory/create.js";

export const insertSupplementCategoryController = async (request, response) => {
  let { nameSupplementCategory } = request.body;
  nameSupplementCategory = nameSupplementCategory.toUpperCase();

  if (!nameSupplementCategory) {
    return response.status(400).json({
      success: false,
      message: 'Bad request: Missing required fields'
    });
  }

  let result = await create(nameSupplementCategory);

  return result.status
    ? response.status(200).json({ sucess: true, id: result.id, message: 'Supplement category successfully registered' })
    : result.error
      ? response.status(500).json({ sucess: false, message: 'Failed to registered supplement category', error: result.error })
      : response.status(400).json({ sucess: false, message: result.message });
}
