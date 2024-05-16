import { createSlice, PayloadAction } from "@reduxjs/toolkit";

export enum TypesNotification {
	success = "success",
	error = "error",
}

interface INotification {
	isOpen: boolean;
	type: TypesNotification;
	title: string;
	text: string;
}

const initialState: INotification = {
	isOpen: false,
	type: TypesNotification.success,
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
			state.type = TypesNotification.error;
		},

		setNotificationSuccess: (state, action: PayloadAction<{ title?: string; text: string }>) => {
			const { title, text } = action.payload;
			state.title = title || "Sucesso";
			state.text = text;
			state.isOpen = true;
			state.type = TypesNotification.success;
		},

		setNotificationClose: (state, action) => {
			state.isOpen = false;
		},
	},
});

export const { setNotificationError, setNotificationSuccess, setNotificationClose } = notificationSlice.actions;
