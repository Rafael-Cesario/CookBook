"use client";

import { theme } from "@/styles/theme";
import styled from "styled-components";

export const StyledLoadingButton = styled.div`
	background-color: ${theme.success};
	border-radius: ${theme.borderRadius};

	margin-top: 3rem;
	padding: 10px 20px;
	opacity: 80%;

	text-align: center;

	color: white;

	span {
		font-weight: bold;
		margin: 0 4px;
	}

	span:nth-child(1) {
		animation: loading 1s infinite;
	}

	span:nth-child(2) {
		animation: loading 1s 0.2s infinite;
	}

	span:nth-child(3) {
		animation: loading 1s 0.4s infinite;
	}

	@keyframes loading {
		0% {
			opacity: 0;
		}

		50% {
			opacity: 1;
		}

		100% {
			opacity: 0;
		}
	}
`;
