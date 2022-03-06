describe('May the Force be with you. (People)', () => {
  beforeEach(() => {
    cy.visit('/')
    cy.request('/people').as('people')
  })

  it('Should get list of People with success', () => {
    cy.get('@people').should((response) => {
      expect(response.status).to.eq(200)
      expect(response.body).to.have.property('results')
    })
  })

  it('Should get first Person properties with success', () => {
    cy.get('@people').should((response) => {
      const firstItem = response.body.results[0]
      expect(firstItem).to.have.property('name')
      expect(firstItem).to.have.property('homeworld')
    })
  })
})
