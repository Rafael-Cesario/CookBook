"use client";

import { useState } from "react";
import { Field } from "./components/field";
import { StyledCreateUserForm } from "./styles/create-user-form";
import { produce } from "immer";
import { IUserData } from "./interfaces/user";
import { UserValidation } from "./helpers/user-validation";
import { UserRequests } from "./requests/user";
import { setNotificationError, setNotificationSuccess } from "@/context/store/slices/notification";
import { useDispatch } from "react-redux";
import { LoadingButton } from "@/components/loading-button";

export const CreateUserForm = () => {
	const userRequests = new UserRequests();
	const userDefaultValues: IUserData = { email: "", name: "", password: "", passwordValidation: "" };

	const [userData, setUserData] = useState({ ...userDefaultValues });
	const [dataErrors, setDataErrors] = useState({ ...userDefaultValues });
	const [loading, setLoading] = useState<boolean>(false);

	const dispatch = useDispatch();

	const createUser = async (e: React.FormEvent) => {
		e.preventDefault();

		const { errors, hasErrors } = validateFields();
		if (hasErrors) return updateErrors(errors);

		setLoading(true);

		const { email, name, password } = userData;
		const response = await userRequests.createUser({ user: { email, name, password } });

		setLoading(false);

		if (response.error) return dispatch(setNotificationError({ text: response.error }));

		setUserData({ ...userDefaultValues });

		dispatch(
			setNotificationSuccess({
				title: "Boas Vindas",
				text: "Sua conta foi criada com sucesso, você já pode fazer login.",
			})
		);

		// Todo >
		// set active form to login
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
			<h1 data-cy="create-user-title" className="title">
				Criar uma Conta
			</h1>

			<form onSubmit={(e) => createUser(e)}>
				<Field
					props={{
						onChange: (value) => updateValues("email", value),
						field: "email",
						label: "Email",
						type: "text",
						error: dataErrors.email,
						value: userData.email,
						focus: true,
					}}
				/>

				<Field
					props={{
						onChange: (value) => updateValues("name", value),
						field: "name",
						label: "Nome",
						type: "text",
						error: dataErrors.name,
						value: userData.name,
					}}
				/>

				<Field
					props={{
						onChange: (value) => updateValues("password", value),
						field: "password",
						label: "Senha",
						type: "password",
						error: dataErrors.password,
						value: userData.password,
					}}
				/>

				<Field
					props={{
						onChange: (value) => updateValues("passwordValidation", value),
						field: "passwordValidation",
						label: "Confirme sua senha",
						type: "password",
						error: dataErrors.passwordValidation,
						value: userData.passwordValidation,
					}}
				/>

				{loading ? (
					<LoadingButton />
				) : (
					<button data-cy="submit-form" className="submit">
						Confirmar
					</button>
				)}
			</form>
		</StyledCreateUserForm>
	);
};
