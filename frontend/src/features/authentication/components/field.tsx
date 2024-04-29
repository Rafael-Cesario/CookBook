import { StyledField } from "./styles/field";

interface IField {
	props: {
		label: string;
		field: string;
		type: "text" | "password";
	};
}

export const Field = ({ props: { field, label, type } }: IField) => {
	return (
		<StyledField>
			<label className="text" htmlFor={`#${field}`}>
				{label}
			</label>

			<input type={type} id={field} />
		</StyledField>
	);
};
