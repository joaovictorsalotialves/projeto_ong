import { remove as AddressRemove } from "../Address/remove.js";
import { findById } from "./findById.js";

export const removeAddress = async (idUser) => {
  let user = await findById(idUser);

  if (user.status) {
    if (user.values.Addresses_idAddress) {
      try {
        let result = await AddressRemove(user.values.Addresses_idAddress);
        return result.status
          ? { status: true }
          : { ...result };
      } catch (error) {
        return { status: false, error: error };
      }
    }

    return {
      status: false,
      message: 'Bad request: User does not have a registered address'
    };
  }

  return {
    status: false,
    message: 'Bad request: Not found user'
  };
}
