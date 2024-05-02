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

	.input-error {
		border: 2px solid ${theme.error};
	}

	input {
		background-color: #11111110;
		border: 2px solid transparent;
		padding: 8px 1rem;
		border-radius: ${theme.borderRadius};

		&:focus {
			outline: 2px solid ${theme.primary + "50"};
		}
	}
`;
