import { Playfair_Display, Courier_Prime } from "next/font/google";

const playfair_display = Playfair_Display({
	variable: "--font-playfair",
	subsets: ["latin"],
	weight: "400",
});

const courier_prime = Courier_Prime({
	variable: "--font-courier",
	subsets: ["latin"],
	weight: "400",
});

export const ClassNameFonts = `${playfair_display.className} ${courier_prime.className}`;
