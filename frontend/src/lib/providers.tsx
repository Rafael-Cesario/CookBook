"use client";
import StyledComponentsRegistry from "./registry";

export const AllProviders = ({ children }: { children: React.ReactNode }) => {
	return <StyledComponentsRegistry>{children}</StyledComponentsRegistry>;
};
