describe("Create User Form", () => {
	beforeEach(() => {
		cy.visit("/");
		cy.get(`[data-cy="create-user"]`).click();
	});

	it("Opens the form", () => {
		cy.get(`[data-cy="create-user-title"]`).should("exist");
	});

	it("Shows and hide password", () => {
		cy.get(`[data-cy="field-password"] > div > input`).as("password");
		cy.get("@password").type("MyPassword123&*(");

		cy.get(`[data-cy="field-password"] > div > [data-cy="show-password"]`).click();
		cy.get(`@password`).should("have.attr", "type", "text");

		cy.get(`[data-cy="field-password"] > div > [data-cy="hide-password"]`).click();
		cy.get("@password").should("have.attr", "type", "password");
	});
});
