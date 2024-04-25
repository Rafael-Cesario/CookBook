import type { Metadata } from "next";
import { ClassNameFonts } from "./fonts";
import { AllProviders } from "@/context/all-providers";
import { GlobalStyle } from "@/styles/styled-global";

interface IRootLayout {
	children: React.ReactNode;
	authentication: React.ReactNode;
}

export const metadata: Metadata = {
	title: "Cookbook",
	description: "Recipes notebook.",
};

export default function RootLayout({ children, authentication }: Readonly<IRootLayout>) {
	const isAuthenticated = false;
	const page = isAuthenticated ? children : authentication;

	return (
		<html lang="pt-br">
			<body className={ClassNameFonts}>
				<AllProviders>
					<GlobalStyle />
					{page}
				</AllProviders>
			</body>
		</html>
	);
}

