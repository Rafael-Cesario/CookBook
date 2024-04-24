import type { Metadata } from "next";
import { ClassNameFonts } from "./fonts";
import { AllProviders } from "@/context/all-providers";
import { GlobalStyle } from "@/styles/styled-global";

export const metadata: Metadata = {
	title: "Cookbook",
	description: "Recipes notebook.",
};

export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
	return (
		<html lang="pt-br">
			<body className={ClassNameFonts}>
				<AllProviders>
					<GlobalStyle />
					{children}
				</AllProviders>
			</body>
		</html>
	);
}

