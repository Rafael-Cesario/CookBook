"use client";

import { useState } from "react";
import { Field } from "./components/field";
import { StyledCreateUserForm } from "./styles/create-user-form";
import { produce } from "immer";

export const CreateUserForm = () => {
	const userDefaultValues = { email: "", name: "", password: "", passwordValidation: "" };

	const [userData, setUserData] = useState({ ...userDefaultValues });
	const [dataErrors, setDataErrors] = useState({ ...userDefaultValues });

	const createUser = (e: React.FormEvent) => {
		e.preventDefault();

		console.log({ userData, dataErrors });

		const { errors, hasErrors } = validateFields();
		if (hasErrors) return updateErrors(errors);
	};

	const updateValues = (field: keyof typeof userDefaultValues, value: string) => {
		const nextState = produce(userData, (draft) => void (draft[field] = value));
		setUserData(nextState);
	};

	const updateErrors = (errors: typeof userDefaultValues) => {
		setDataErrors(errors);
	};

	// Todo >
	const validateFields = () => {
		const fields = Object.entries(userData);
		const errors = { ...userDefaultValues };
		let hasErrors = false;

		fields.forEach(([key, value]) => {
			// Validate field
			// errors[key] = error
			// if error hasErrors = true;
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
