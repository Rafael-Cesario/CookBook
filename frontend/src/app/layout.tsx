import type { Metadata } from "next";
import { ClassNameFonts } from "./fonts";

export const metadata: Metadata = {
	title: "Cookbook",
	description: "Recipes notebook.",
};

export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
	return (
		<html lang="pt-br">
			<body className={ClassNameFonts}>{children}</body>
		</html>
	);
}
