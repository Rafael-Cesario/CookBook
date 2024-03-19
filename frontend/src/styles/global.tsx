"use client";

import * as styled from "styled-components";

export const GlobalStyled = styled.createGlobalStyle`
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
    font-family: var(--font-courier), 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    font-weight: 400;
	}

	body {
		background-color: black;
		color: white;
	}
`;
