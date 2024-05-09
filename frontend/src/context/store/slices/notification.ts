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
	reducers: {},
});

export const {} = notificationSlice.actions;
