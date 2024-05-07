import axios from "axios";
import { ICreateUser, RCreateUser } from "../interfaces/user";

// Todo >
// const userRequestErrors = {
// 	duplicatedEmail: "Esse endereço de email já está em uso."
// }

export class UserRequests {
	private URL = "http://localhost:8080/api/users";

	async createUser(user: ICreateUser) {
		try {
			const response = await axios.post(this.URL, user);
			const data: RCreateUser = response.data;
			return { data, error: null };
		} catch (error: any) {
			// Todo >
			// Catch Errors
			console.log({ error: error.response.data.errors });
			return { data: null, error: "Um erro inesperado ocorreu" };
		}
	}
}
