import axios from "axios";
import { ICreateUser, RCreateUser } from "../interfaces/user";
import { UserRequestErrors } from "../helpers/user-request-errors";

export class UserRequests {
	private URL = "http://localhost:8080/api/users";
	private userErrors = new UserRequestErrors();

	async createUser(user: ICreateUser) {
		try {
			const response = await axios.post(this.URL, user);
			const data: RCreateUser = response.data;
			return { data, error: null };
		} catch (error: any) {
			const message = error.response.data.errors[0];
			const formatedMessage = this.userErrors.getError(message);
			return { data: null, error: formatedMessage };
		}
	}
}
