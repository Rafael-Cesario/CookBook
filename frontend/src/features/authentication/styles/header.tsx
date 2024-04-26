"use client";

import { theme } from "@/styles/theme";
import styled from "styled-components";

export const StyledHeader = styled.header`
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin: 1rem 20rem;

	.title {
		display: flex;
		align-items: center;

		.icon {
			margin-right: 4px;
		}
	}

	.open-forms {
		.create,
		.login {
			padding: 8px 20px;

			&:hover {
				background-color: ${theme.text};
				color: white;
			}
		}

		.create {
			margin-right: 8px;
			background-color: transparent;
		}

		.login {
			background-color: ${theme.primary};
			color: white;
			font-weight: normal;
		}
	}
`;
