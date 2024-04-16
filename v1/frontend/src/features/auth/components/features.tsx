import { StyledFeatures } from "../styles/features";

export const Features = () => {
	return (
		<StyledFeatures>
			<div className="feat">
				<h1 className="title">Listas</h1>
				<p className="text">
					Organize-se criando listas para encontrar facilmente seus bolos favoritos, refeições prediletas ou seu lanche
					seguindo sua dieta.
				</p>
			</div>

			<div className="feat">
				<h1 className="title">Receitas</h1>
				<p className="text">
					Adicione os ingredientes, instruções, tempo de preparo e salve sua receita para saborear quando quiser.
				</p>
			</div>

			<div className="feat">
				<h1 className="title">Imagens</h1>
				<p className="text">Faça upload de imagens para usar como capa para suas receitas.</p>
			</div>
		</StyledFeatures>
	);
};
