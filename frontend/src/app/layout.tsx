import type { Metadata } from "next";
import { fontNames } from "./fonts";
import { AllProviders } from "@/lib/providers";
import { GlobalStyled } from "@/styles/global";

export const metadata: Metadata = {
	title: "Cookbook",
	description: "Your recipe book",
};

export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
	return (
		<html lang="pt-br">
			<body className={fontNames}>
				<AllProviders>
					<GlobalStyled />
					{children}
				</AllProviders>
			</body>
		</html>
	);
}

