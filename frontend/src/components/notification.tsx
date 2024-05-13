import { useSelector } from "react-redux";
import { StyledNotification } from "./styles/notification";
import { Store } from "@/context/store/store";

export const Notification = () => {
	// const { isOpen, text, title, type } = useSelector((state: Store) => state.notification);

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
