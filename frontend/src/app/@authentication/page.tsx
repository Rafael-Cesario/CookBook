"use client";

import { FormContainer } from "@/features/authentication/components/form-container";
import { CreateUserForm } from "@/features/authentication/create-user-form";
import { Features } from "@/features/authentication/features";
import { Header } from "@/features/authentication/header";
import { Forms } from "@/features/authentication/interfaces/forms";
import { Intro } from "@/features/authentication/intro";
import { useState } from "react";

export default function Authentication() {
	const [activeForm, setActiveForm] = useState<Forms>(Forms.close);

	return (
		<>
			<Header props={{ activeForm, setActiveForm }} />
			<Intro />
			<Features />

			{activeForm !== Forms.close && (
				<FormContainer props={{ setActiveForm }}>
					<CreateUserForm />
				</FormContainer>
			)}
		</>
	);
}
