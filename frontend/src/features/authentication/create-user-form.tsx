"use client";

import { useState } from "react";
import { Field } from "./components/field";
import { StyledCreateUserForm } from "./styles/create-user-form";
import { produce } from "immer";
import { IUserData } from "./interfaces/user";
import { UserValidation } from "./helpers/user-validation";
import { UserRequests } from "./requests/user";

export const CreateUserForm = () => {
	const userRequests = new UserRequests();
	const userDefaultValues: IUserData = { email: "", name: "", password: "", passwordValidation: "" };

	const [userData, setUserData] = useState({ ...userDefaultValues });
	const [dataErrors, setDataErrors] = useState({ ...userDefaultValues });

	const createUser = async (e: React.FormEvent) => {
		e.preventDefault();

		const { errors, hasErrors } = validateFields();
		if (hasErrors) return updateErrors(errors);

		const { email, name, password } = userData;
		const response = await userRequests.createUser({ user: { email, name, password } });

		// Todo >
		// catch errors
		// Send notification with error message
		if (response.error || !response.data) return;

		// Todo >
		// Clear form
		// Success notification
		// set active form to login
		console.log({ response });
	};

	const updateValues = (field: keyof IUserData, value: string) => {
		const nextState = produce(userData, (draft) => void (draft[field] = value));
		setUserData(nextState);
	};

	const updateErrors = (errors: IUserData) => {
		setDataErrors(errors);
	};

	const validateFields = () => {
		const validate = new UserValidation(userData);

		const fields = Object.keys(userData) as (keyof IUserData)[];
		const errors: IUserData = { ...userDefaultValues };
		let hasErrors = false;

		fields.forEach((field) => {
			const error = validate[field]();
			if (error) hasErrors = true;
			errors[field] = error;
		});

		return { hasErrors, errors };
	};

	return (
		<StyledCreateUserForm>
			<h1 className="title">Criar uma Conta</h1>

			<form onSubmit={(e) => createUser(e)}>
				<Field
					props={{
						onChange: (value) => updateValues("email", value),
						field: "email",
						label: "Email",
						type: "text",
						error: dataErrors.email,
					}}
				/>

				<Field
					props={{
						onChange: (value) => updateValues("name", value),
						field: "name",
						label: "Nome",
						type: "text",
						error: dataErrors.name,
					}}
				/>

				<Field
					props={{
						onChange: (value) => updateValues("password", value),
						field: "password",
						label: "Senha",
						type: "password",
						error: dataErrors.password,
					}}
				/>

				<Field
					props={{
						onChange: (value) => updateValues("passwordValidation", value),
						field: "passwordValidation",
						label: "Confirme sua senha",
						type: "password",
						error: dataErrors.passwordValidation,
					}}
				/>

				<button className="submit">Confirmar</button>
			</form>
		</StyledCreateUserForm>
	);
};
