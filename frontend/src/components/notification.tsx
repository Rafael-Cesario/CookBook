import { useDispatch, useSelector } from "react-redux";
import { StyledNotification } from "./styles/notification";
import { Store } from "@/context/store/store";
import { setNotificationClose } from "@/context/store/slices/notification";

export const Notification = () => {
	const { isOpen, text, title, type } = useSelector((state: Store) => state.notification);
	const dispatch = useDispatch();

	if (!isOpen) return;

	return (
		<StyledNotification type={type}>
			<div className="head">
				<h1 className="title">{title}</h1>
				<button className="close" onClick={() => dispatch(setNotificationClose({}))}>
					x
				</button>
			</div>
			<p className="text">{text}</p>
		</StyledNotification>
	);
};
