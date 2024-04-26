import { FormContainer } from "@/features/authentication/components/form-container";
import { CreateUserForm } from "@/features/authentication/create-user-form";
import { Features } from "@/features/authentication/features";
import { Header } from "@/features/authentication/header";
import { Intro } from "@/features/authentication/intro";

export default function Authentication() {
	return (
		<>
			<Header />
			<Intro />
			<Features />

			<FormContainer>
				<CreateUserForm />
			</FormContainer>
		</>
	);
}
