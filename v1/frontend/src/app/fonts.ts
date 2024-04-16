import { Playfair_Display, Courier_Prime } from "next/font/google";

const playfairDisplay = Playfair_Display({ subsets: ["latin"], variable: "--font-playfair" });
const courierPrime = Courier_Prime({ subsets: ["latin"], weight: ["400", "700"], variable: "--font-courier" });

export const fontNames = `${playfairDisplay.variable} ${courierPrime.variable}`;
