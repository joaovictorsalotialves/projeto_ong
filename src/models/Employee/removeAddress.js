import { remove as AddressRemove } from "../Address/remove.js";
import { findById } from "./findById.js";

export const removeAddress = async (idEmployee) => {
  let employee = await findById(idEmployee);

  if (employee.status) {
    if (employee.values.Addresses_idAddress !== null) {
      try {
        await AddressRemove(employee.values.Addresses_idAddress);
        return { status: true };
      } catch (error) {
        return { status: false, error: error };
      }
    }
    return {
      status: false,
      message: 'Bad request: Employee does not have a registered address'
    };
  }
  return {
    status: false,
    message: 'Bad request: Not found employee'
  };
}
