import { Forms } from "../interfaces/forms";
import { StyledFormContainer } from "./styles/form-container";

interface IFormContainer {
	children: React.ReactNode;
	props: { setActiveForm(form: Forms): void };
}

export const FormContainer = ({ children, props: { setActiveForm } }: IFormContainer) => {
	return (
		<StyledFormContainer>
			<div className="container">
				<button className="close" onClick={() => setActiveForm(Forms.close)}>
					x
				</button>

				{children}
			</div>
		</StyledFormContainer>
	);
};
