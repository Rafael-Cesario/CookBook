import { createSlice, PayloadAction } from "@reduxjs/toolkit";

interface INotification {
	isOpen: boolean;
	type: "success" | "error";
	title: string;
	text: string;
}

const initialState: INotification = {
	isOpen: false,
	type: "success",
	title: "",
	text: "",
};

export const notificationSlice = createSlice({
	name: "notification",
	initialState,
	reducers: {
		setNotificationError: (state, action: PayloadAction<{ title?: string; text: string }>) => {
			const { title, text } = action.payload;
			state.title = title || "Erro";
			state.text = text;
			state.isOpen = true;
			state.type = "error";
		},
	},
});

export const { setNotificationError } = notificationSlice.actions;
