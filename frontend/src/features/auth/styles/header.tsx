"use client";

import { palette } from "@/styles/palette";
import styled from "styled-components";

export const StyledHeader = styled.header`
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin: 2rem 16rem;

	.title {
		display: flex;
		align-items: center;

		h1 {
			font-size: 2rem;
			margin-left: 8px;
			font-weight: bold;
			font-family: var(--font-playfair);
		}
	}

	.form-buttons {
		.create {
			color: ${palette.text};
			background-color: transparent;
			margin-right: 8px;
		}

		.login {
			color: ${palette.background};
			background-color: ${palette.primary};
		}
	}

	@media (max-width: 1350px) {
		margin: 2rem 8rem;
	}

	@media (max-width: 700px) {
		flex-direction: column;

		.form-buttons {
			margin-top: 1rem;
		}
	}
`;
