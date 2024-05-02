import { StyledField } from "./styles/field";

interface IField {
	props: {
		label: string;
		field: string;
		type: "text" | "password";
		onChange(value: string): void;
		error: string;
	};
}

export const Field = ({ props: { field, label, type, onChange, error } }: IField) => {
	const errorClass = error ? "input-error" : "";

	return (
		<StyledField>
			<label className="text" htmlFor={`#${field}`}>
				{label}
			</label>

			<input onChange={(e) => onChange(e.target.value)} type={type} id={field} className={`${errorClass}`} />

			<span className="error">{error}</span>
		</StyledField>
	);
};
