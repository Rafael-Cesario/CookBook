import { useSelector } from "react-redux";
import { StyledNotification } from "./styles/notification";
import { Store } from "@/context/store/store";

export const Notification = () => {
	const { isOpen, text, title, type } = useSelector((state: Store) => state.notification);

	if (!isOpen) return;

	return (
		<StyledNotification type={type}>
			<div className="head">
				<h1 className="title">{title}</h1>
				<button className="close">x</button>
			</div>
			<p className="text">{text}</p>
		</StyledNotification>
	);
};
