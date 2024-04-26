"use client";

import { theme } from "@/styles/theme";
import styled from "styled-components";

export const StyledFormContainer = styled.div`
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: #11111120;
	backdrop-filter: blur(2px);

	display: flex;
	justify-content: center;
	align-items: center;

	.container {
    padding: 2rem 4rem;
		background-color: ${theme.background};
    border-radius: ${theme.borderRadius};
	}
`;
