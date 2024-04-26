import { StyledCreateUserForm } from "./styles/create-user-form";

export const CreateUserForm = () => {
	return (
		<StyledCreateUserForm>
			<h1 className="title">Criar uma Conta</h1>

			<form>
				<div className="field">
					<label className="text" htmlFor="#email">
						Email
					</label>
					<input type="text" id="email" />
				</div>

				<div className="field">
					<label className="text" htmlFor="#name">
						Nome
					</label>
					<input type="text" id="name" />
				</div>

				<div className="field">
					<label className="text" htmlFor="#password">
						Senha
					</label>
					<input type="text" id="password" />
				</div>

				<div className="field">
					<label className="text" htmlFor="#password-validation">
						Confirme sua senha
					</label>
					<input type="text" id="password-validation" />
				</div>

				<button className="submit">Confirmar</button>
			</form>
		</StyledCreateUserForm>
	);
};
