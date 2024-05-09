"use client";

import StyledComponentsRegistry from "@/lib/styled-components";
import { store } from "./store/store";
import { Provider as ReduxProvider } from "react-redux";

interface Props {
	children: React.ReactNode;
}

export const AllProviders = ({ children }: Props) => {
	return (
		<ReduxProvider store={store}>
			<StyledComponentsRegistry>{children}</StyledComponentsRegistry>;
		</ReduxProvider>
	);
};
