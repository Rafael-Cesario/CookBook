import { defineConfig } from "cypress";

export default defineConfig({
	screenshotOnRunFailure: false,
	watchForFileChanges: false,

	e2e: {
		baseUrl: "http://localhost:3000",
		setupNodeEvents(on, config) {},
	},
});

