"use client";

import styled from "styled-components";

export const StyledFeatures = styled.footer`
	margin: 2rem 16rem;

	display: grid;
	align-items: center;
	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
	column-gap: 8rem;
	row-gap: 2rem;

	.feat {
		.title {
			font-family: var(--font-playfair);
			font-weight: bold;
			margin-bottom: 8px;
			font-size: 1.2rem;
		}
	}

	@media (max-width: 1350px) {
		margin: 2rem 8rem;
	}

	@media (max-width: 780px) {
		margin: 2rem;
	}
`;
