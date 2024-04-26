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
		.field {
			display: flex;
			flex-direction: column;
			margin-bottom: 1rem;
			width: 300px;

			.text {
				font-size: 0.8rem;
				margin: 4px 1rem;
			}

			input {
				background-color: #11111120;
				border: none;
				padding: 8px 1rem;
				border-radius: ${theme.borderRadius};

				&:focus {
					outline: 2px solid ${theme.primary + "50"};
				}
			}
		}

		.submit {
			background-color: ${theme.primary};
			color: white;
			padding: 10px 20px;
			width: 100%;
			margin-top: 2rem;
		}
	}
`;
