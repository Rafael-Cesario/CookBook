"use client";

import { useState } from "react";
import { StyledField } from "./styles/field";
import { AiFillEye, AiFillEyeInvisible } from "react-icons/ai";

interface IField {
	props: {
		label: string;
		field: string;
		type: "text" | "password";
		onChange(value: string): void;
		error: string;
		value: string;
	};
}

export const Field = ({ props: { value, field, label, type, onChange, error } }: IField) => {
	const [showPassword, setShowPassword] = useState(false);
	const errorClass = error ? "input-error" : "";
	const passwordType = showPassword ? "text" : "password";

	return (
		<StyledField>
			<label className="text" htmlFor={`#${field}`}>
				{label}
			</label>

			<div className={`input-area ${errorClass}`}>
				<input
					onChange={(e) => onChange(e.target.value)}
					type={type === "password" ? passwordType : "text"}
					id={field}
					value={value}
				/>

				{type === "password" && showPassword && (
					<AiFillEye onClick={() => setShowPassword(!showPassword)} className="icon" title="Esconder" />
				)}

				{type === "password" &&
					(showPassword || (
						<AiFillEyeInvisible onClick={() => setShowPassword(!showPassword)} className="icon" title="Mostrar senha" />
					))}
			</div>

			<span className="error">{error}</span>
		</StyledField>
	);
};
