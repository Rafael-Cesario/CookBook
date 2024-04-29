import { Field } from "./components/field";
import { StyledCreateUserForm } from "./styles/create-user-form";

export const CreateUserForm = () => {
	return (
		<StyledCreateUserForm>
			<h1 className="title">Criar uma Conta</h1>

			<form>
				<Field props={{ field: "email", label: "Email", type: "text" }} />
				<Field props={{ field: "name", label: "Nome", type: "text" }} />
				<Field props={{ field: "password", label: "Senha", type: "password" }} />
				<Field props={{ field: "passwordValidation", label: "Confirme sua senha", type: "password" }} />

				<button className="submit">Confirmar</button>
			</form>
		</StyledCreateUserForm>
	);
};
