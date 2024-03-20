import { StyledHeader } from "@/features/auth/styles/header";
import Image from "next/image";

const Auth = () => {
	return (
		<>
			<StyledHeader>
				<div className="title">
					<Image src={`/chef.png`} alt="Cooking chef icon" width="32" height="32" />
					<h1>Cookbook</h1>
				</div>

				<div className="form-buttons">
					<button className="create">Criar conta</button>
					<button className="login">Entrar</button>
				</div>
			</StyledHeader>
		</>
	);
};

export default Auth;
