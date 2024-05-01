import { IUserData } from "../interfaces/user";

interface IUserValidation {
	email(): string;
	name(): string;
	password(): string;
	passwordValidation(): string;
}

export class UserValidation implements IUserValidation {
	constructor(private userData: IUserData) {}

	email(): string {
		const { email } = this.userData;
		if (!email) return "Este campo não pode ficar vazio.";

		const [user, domain] = email.split("@");
		if (!user || !domain) return "Email invalido.";

		return "";
	}

	name(): string {
		const { name } = this.userData;
		if (!name) return "Este campo não pode ficar vazio.";
		if (name.length > 30) return "Máximo de 30 caracteres";

		return "";
	}

	password(): string {
		return "";
	}
	passwordValidation(): string {
		return "";
	}
}
