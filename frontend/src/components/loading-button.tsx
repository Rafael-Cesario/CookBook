import { StyledLoadingButton } from "./styles/loading-button";

export const LoadingButton = () => {
	return (
		<StyledLoadingButton data-cy="loading-button">
			<span>-</span>
			<span>-</span>
			<span>-</span>
		</StyledLoadingButton>
	);
};
