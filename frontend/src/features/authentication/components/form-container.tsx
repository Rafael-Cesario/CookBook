import { StyledFormContainer } from "./styles/form-container";

interface IFormContainer {
	children: React.ReactNode;
}

export const FormContainer = ({ children }: IFormContainer) => {
	return (
		<StyledFormContainer>
			<div className="container">
				<button className="close">x</button>
				{children}
			</div>
		</StyledFormContainer>
	);
};
