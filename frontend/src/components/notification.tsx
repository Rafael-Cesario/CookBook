import { StyledNotification } from "./styles/notification";

export const Notification = () => {
	return (
		<StyledNotification>
			<div className="head">
				<h1 className="title">Algo deu errado</h1>
				<button className="close">x</button>
			</div>
			<p className="text">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Enim, harum!</p>
		</StyledNotification>
	);
};
