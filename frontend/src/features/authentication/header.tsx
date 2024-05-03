import Image from "next/image";
import { StyledHeader } from "./styles/header";
import { Forms } from "./interfaces/forms";

interface IHeader {
	props: {
		activeForm: Forms;
		setActiveForm(form: Forms): void;
	};
}

export const Header = ({ props: { activeForm, setActiveForm } }: IHeader) => {
	return (
		<StyledHeader>
			<div className="title">
				<Image className="icon" alt="Chef's hat logo" src={"/icons/chef.png"} width={30} height={30} />
				<h1>Cookbook</h1>
			</div>

			<div className="open-forms">
				<button onClick={() => setActiveForm(Forms.create)} className="create">
					Criar uma conta
				</button>

				<button className="login">Entrar</button>
			</div>
		</StyledHeader>
	);
};
