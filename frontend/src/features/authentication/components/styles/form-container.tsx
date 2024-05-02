"use client";

import { theme } from "@/styles/theme";
import styled from "styled-components";

export const StyledFormContainer = styled.div`
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	min-height: 100%;
	background-color: #11111120;
	backdrop-filter: blur(2px);

	display: flex;
	justify-content: center;

	.container {
		margin: 4rem;
		padding: 1rem;
		background-color: ${theme.background};
		border-radius: ${theme.borderRadius};
		height: fit-content;

		display: flex;
		flex-direction: column;
		align-items: center;

		.close {
			align-self: flex-end;
			background-color: transparent;
			font-size: 1rem;
			font-weight: bold;
			opacity: 0.5;
			padding: 1rem 2rem;

			&:hover {
				background-color: ${theme.error};
				color: white;
				opacity: 1;
				font-weight: normal;
			}
		}
	}
`;
