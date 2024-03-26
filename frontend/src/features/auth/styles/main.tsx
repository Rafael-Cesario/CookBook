"use client";

import { palette } from "@/styles/palette";
import styled from "styled-components";

export const StyledMain = styled.main`
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	justify-content: space-between;
	margin: 8rem 16rem;

	.introduction {
		max-width: 480px;

		.title {
			font-family: var(--font-playfair);
			font-weight: bold;
			text-transform: capitalize;
			margin-bottom: 8px;
		}
	}

	.picture {
		position: relative;
		margin: 1rem;

		&::after {
			content: "";
			position: absolute;
			top: 0;
			left: -2rem;
			width: 250px;
			height: 250px;
			z-index: -1;

			background-color: ${palette.primary};
			opacity: 20%;
			border-radius: ${palette.borderRadius};
		}
	}

	@media (max-width: 1350px) {
		flex-direction: column;
		justify-content: center;
		margin: 2rem 2rem;

		.introduction {
			text-align: center;
		}
	}
`;
