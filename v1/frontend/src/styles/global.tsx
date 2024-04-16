"use client";

import * as styled from "styled-components";
import { palette } from "./palette";

export const GlobalStyled = styled.createGlobalStyle`
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;

		font-family: var(--font-courier), "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
		font-weight: 400;
	}

	body {
		background-color: ${palette.background};
		color: ${palette.text};
	}

	button {
		font-weight: bold;
		font-size: 1rem;
		outline: none;
		border: none;
		padding: 4px 12px;
		border-radius: ${palette.borderRadius};
		transition: 0.1s ease-in-out;
		cursor: pointer;

		border: 1px solid #00000050;
		box-shadow: 2px 2px 4px #00000020;

		&:hover {
			transform: scale(1.05);
		}

		&:active {
			transform: scale(1);
		}
	}
`;
