describe("Create User Form", () => {
	beforeEach(() => {
		cy.visit("/");
		cy.get(`[data-cy="create-user"]`).click();
	});

	it("Opens the form", () => {
		cy.get(`[data-cy="create-user-title"]`).should("exist");
	});

	it("Has email field focused", () => {
		cy.get(`[data-cy="field-email"] > div > #email`).should("have.focus");
	});

	it("Shows and hide password", () => {
		cy.get(`[data-cy="field-password"] > div > input`).as("password");
		cy.get("@password").type("MyPassword123&*(");

		cy.get(`[data-cy="field-password"] > div > [data-cy="show-password"]`).click();
		cy.get(`@password`).should("have.attr", "type", "text");

		cy.get(`[data-cy="field-password"] > div > [data-cy="hide-password"]`).click();
		cy.get("@password").should("have.attr", "type", "password");
	});

	context("Show fields errors", () => {
		it("Has empty fields", () => {
			cy.get(`[data-cy="submit-form"]`).click();
			cy.get(`[data-cy="field-email"] > .error`).should("have.text", "Este campo não pode ficar vazio.");
			cy.get(`[data-cy="field-name"] > .error`).should("have.text", "Este campo não pode ficar vazio.");
			cy.get(`[data-cy="field-password"] > .error`).should("have.text", "Este campo não pode ficar vazio.");
			cy.get(`[data-cy="field-passwordValidation"] > .error`).should("have.text", "Este campo não pode ficar vazio.");
		});

		it("Has an invalid email", () => {
			cy.get(`[data-cy="field-email"] > div > input`).type("not valid");
			cy.get(`[data-cy="submit-form"]`).click();
			cy.get(`[data-cy="field-email"] > .error`).should("have.text", "Email invalido.");
		});

		it("Has a weak password", () => {
			const errorMessage = "Sua senha precisa ter no mínimo 10 caracteres.";
			cy.get(`[data-cy="field-password"] > div > input`).type("pass 123");
			cy.get(`[data-cy="submit-form"]`).click();
			cy.get(`[data-cy="field-password"] > .error`).should("have.text", errorMessage);
		});
	});
});
