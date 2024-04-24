"use client";

import StyledComponentsRegistry from "@/lib/styled-components";

interface Props {
	children: React.ReactNode;
}

export const AllProviders = ({ children }: Props) => {
	return <StyledComponentsRegistry>{children}</StyledComponentsRegistry>;
};
