"use client";

import * as styled from "styled-components";
import { theme } from "./theme";

export const GlobalStyle = styled.createGlobalStyle`
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
		font-family: var(--font-courier), var(--font-playfair), Arial, sans-serif;
	}

	body {
		background-color: ${theme.background};
		color: ${theme.text};
	}

	h1 {
		font-family: var(--font-playfair);
	}
`;
