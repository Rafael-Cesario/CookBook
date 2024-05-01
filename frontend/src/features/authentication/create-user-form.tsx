"use client";

import { useState } from "react";
import { Field } from "./components/field";
import { StyledCreateUserForm } from "./styles/create-user-form";
import { produce } from "immer";
import { IUserData } from "./interfaces/user";
import { UserValidation } from "./helpers/user-validation";

export const CreateUserForm = () => {
	const userDefaultValues: IUserData = { email: "", name: "", password: "", passwordValidation: "" };

	const [userData, setUserData] = useState({ ...userDefaultValues });
	const [dataErrors, setDataErrors] = useState({ ...userDefaultValues });

	// Todo > Tests
	const createUser = (e: React.FormEvent) => {
		e.preventDefault();

		console.log({ userData, dataErrors });

		const { errors, hasErrors } = validateFields();
		console.log({ errors, hasErrors, emailError: errors.email });
		if (hasErrors) return updateErrors(errors);

		console.log("Create user");
	};

	const updateValues = (field: keyof IUserData, value: string) => {
		const nextState = produce(userData, (draft) => void (draft[field] = value));
		setUserData(nextState);
	};

	const updateErrors = (errors: IUserData) => {
		setDataErrors(errors);
	};

	// Todo >
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
					}}
				/>

				<Field
					props={{
						onChange: (value) => updateValues("name", value),
						field: "name",
						label: "Nome",
						type: "text",
					}}
				/>

				<Field
					props={{
						onChange: (value) => updateValues("password", value),
						field: "password",
						label: "Senha",
						type: "password",
					}}
				/>

				<Field
					props={{
						onChange: (value) => updateValues("passwordValidation", value),
						field: "passwordValidation",
						label: "Confirme sua senha",
						type: "password",
					}}
				/>

				<button className="submit">Confirmar</button>
			</form>
		</StyledCreateUserForm>
	);
};
