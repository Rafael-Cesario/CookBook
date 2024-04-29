"use client";

import { theme } from "@/styles/theme";
import styled from "styled-components";

export const StyledCreateUserForm = styled.div`
	margin: 2rem 4rem;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;

	.title {
		font-size: 1rem;
		margin-bottom: 2rem;
	}

	form {
		.submit {
			background-color: ${theme.primary};
			color: white;
			padding: 10px 20px;
			width: 100%;
			margin-top: 2rem;
		}
	}
`;
