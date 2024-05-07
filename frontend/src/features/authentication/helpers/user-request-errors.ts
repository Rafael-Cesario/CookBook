interface IErrorsCode {
	duplicated: string;
	default: string;
}

export class UserRequestErrors {
	private ErrorsCode: IErrorsCode = {
		duplicated: "Esse endereço de email já está em uso.",
		default: "Um erro inesperado ocorreu.",
	};

	getError(message: string) {
		const keys = Object.keys(this.ErrorsCode);
		const code = keys.find((key) => message.includes(key)) as keyof IErrorsCode;
		return this.ErrorsCode[code] || this.ErrorsCode.default;
	}
}
