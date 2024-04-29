import { StyledField } from "./styles/field";

interface IField {
	props: {
		label: string;
		field: string;
		type: "text" | "password";
		onChange(value: string): void;
	};
}

export const Field = ({ props: { field, label, type, onChange } }: IField) => {
	return (
		<StyledField>
			<label className="text" htmlFor={`#${field}`}>
				{label}
			</label>

			<input onChange={(e) => onChange(e.target.value)} type={type} id={field} />
		</StyledField>
	);
};
