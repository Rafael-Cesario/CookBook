"use client";

import { theme } from "@/styles/theme";
import styled from "styled-components";

export const StyledField = styled.div`
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
`;
