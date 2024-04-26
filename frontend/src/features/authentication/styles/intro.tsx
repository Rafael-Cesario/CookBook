"use client";

import { theme } from "@/styles/theme";
import styled from "styled-components";

export const StyledIntro = styled.div`
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: 10rem 20rem;

	.description {
		width: 500px;

		.title {
			font-size: 2.5rem;
			margin-bottom: 8px;
			text-transform: capitalize;
		}
	}

	.picture {
		position: relative;

		&::before {
			content: "";
			border-radius: ${theme.borderRadius};
			width: 350px;
			height: 350px;
			background-color: ${theme.primary};
			opacity: 20%;
			position: absolute;
			left: -1rem;
			z-index: -1;
		}
	}
`;
