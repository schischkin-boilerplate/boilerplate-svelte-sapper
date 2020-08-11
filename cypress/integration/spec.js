describe('Simple test', () => {
	beforeEach(() => {
		cy.visit('/')
	});
	it('has the correct <h1>', () => {
		cy.contains('h1', 'It works!')
	});
});
