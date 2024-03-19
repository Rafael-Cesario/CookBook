import type { Metadata } from "next";
import { fontNames } from "./fonts";

export const metadata: Metadata = {
	title: "Cookbook",
	description: "Your recipe book",
};

export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
	return (
		<html lang="pt-br">
			<body className={fontNames}>{children}</body>
		</html>
	);
}

