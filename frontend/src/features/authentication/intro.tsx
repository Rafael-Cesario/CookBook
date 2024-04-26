import Image from "next/image";
import { StyledIntro } from "./styles/intro";

export const Intro = () => {
	return (
		<StyledIntro>
			<div className="description">
				<h1 className="title">A melhor maneira de colecionar receitas</h1>
				<p className="text">Salve suas refeições e suas sobremesas favoritas nas medidas perfeitas para você.</p>
			</div>

			<div className="picture">
				<Image className="icon" width={400} height={400} alt="Recipes notebook logo" src={"/icons/cookbook.png"} />
			</div>
		</StyledIntro>
	);
};
