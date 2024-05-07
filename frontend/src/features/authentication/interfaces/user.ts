export interface IUserData {
	email: string;
	name: string;
	password: string;
	passwordValidation: string;
}

export interface ICreateUser {
	user: {
		email: string;
		name: string;
		password: string;
	};
}

export interface RCreateUser {
	id: string;
	email: string;
	message: string;
}
