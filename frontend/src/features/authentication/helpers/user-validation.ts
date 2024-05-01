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
		return "";
	}

	name(): string {
		return "";
	}
	password(): string {
		return "";
	}
	passwordValidation(): string {
		return "";
	}
}
