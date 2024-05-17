describe("Create User Form", () => {
	beforeEach(() => {
		cy.visit("/");
	});

	it("Opens the form", () => {
		cy.get(`[data-cy="create-user"]`).click();
		cy.get(`[data-cy="create-user-title"]`).should("exist");
	});
});
