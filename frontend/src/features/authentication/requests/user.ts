import axios from "axios";
import { ICreateUser, RCreateUser } from "../interfaces/user";

export class UserRequests {
	private URL = "http://localhost:8080/api/users";

	async createUser(user: ICreateUser) {
		const response = await axios.post(this.URL, user);
		console.log({ response });
	}
}
