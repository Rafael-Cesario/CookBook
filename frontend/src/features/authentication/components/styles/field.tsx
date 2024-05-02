"use client";

import { theme } from "@/styles/theme";
import styled from "styled-components";

export const StyledField = styled.div`
	display: flex;
	flex-direction: column;
	margin-bottom: 1rem;
	width: 300px;

	.text,
	.error {
		font-size: 0.8rem;
		margin: 4px 1rem;
	}

	.error {
		color: ${theme.error};
	}

	.input-area {
		display: flex;
		background-color: #11111110;
		border-radius: ${theme.borderRadius};

		.input-error {
			border: 2px solid ${theme.error};
		}

		.icon {
			cursor: pointer;
			height: 100%;
			align-self: center;
			margin: 8px;
			width: 20px;
		}

		input {
			border-radius: ${theme.borderRadius};
			background-color: transparent;
			width: 100%;
			border: 2px solid transparent;
			padding: 8px 1rem;

			&:focus {
				outline: 2px solid ${theme.primary + "50"};
			}
		}
	}
`;
