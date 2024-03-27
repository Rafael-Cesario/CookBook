import Image from "next/image";
import { StyledMain } from "../styles/main";

export const Main = () => {
	return (
		<StyledMain>
			<div className="introduction">
				<h1 className="title">A melhor maneira <br /> de colecionar receitas</h1>
				<p className="text">Salve suas refeições e suas sobremesas favoritas nas medidas perfeitas para você.</p>
			</div>

			<div className="picture">
        <Image src="/cookbook.png" alt="recipe book logo image" width="300" height="300" />
      </div>
		</StyledMain>
	);
};
