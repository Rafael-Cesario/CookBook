"use client";

import { TypesNotification } from "@/context/store/slices/notification";
import { theme } from "@/styles/theme";
import styled from "styled-components";

export const StyledNotification = styled.div<{ type: TypesNotification }>`
	--color-by-type: ${({ type }) => (type === TypesNotification.success ? theme.success : theme.error)};

	position: absolute;
	top: 0;
	right: 0;
	background-color: ${theme.background};
	border-left: 8px solid var(--color-by-type);
	margin: 1rem;
	width: 400px;
	border-radius: ${theme.borderRadius};
	padding: 1rem;
	z-index: 1;

	.head {
		display: flex;
		justify-content: space-between;
		align-items: flex-start;
		margin-bottom: 8px;

		.title {
			font-size: 1.1rem;
			color: var(--color-by-type);
		}
	}
`;
