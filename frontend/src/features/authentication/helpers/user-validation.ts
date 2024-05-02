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
		const { password } = this.userData;

		if (!password) return "Este campo não pode ficar vazio.";
		if (password.length < 10) return "Sua senha precisa ter no mínimo 10 caracteres.";
		if (!/[a-z]/.test(password)) return "Sua senha precisa conter letras maiúsculas e minúsculas.";
		if (!/[A-Z]/.test(password)) return "Sua senha precisa conter letras maiúsculas e minúsculas.";
		if (!/[0-9]/.test(password)) return "Sua senha não é forte o suficiente, adicione ao menos um número.";

		return "";
	}

	passwordValidation(): string {
		const { password, passwordValidation } = this.userData;
		if (password !== passwordValidation) return "Suas senhas não estão iguais.";

		return "";
	}
}
