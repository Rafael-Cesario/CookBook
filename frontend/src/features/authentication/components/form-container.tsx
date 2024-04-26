import { StyledFormContainer } from "./styles/form-container";

interface IFormContainer {
	children: React.ReactNode;
}

export const FormContainer = ({ children }: IFormContainer) => {
	return (
		<StyledFormContainer>
			<div className="container">{children}</div>
		</StyledFormContainer>
	);
};
