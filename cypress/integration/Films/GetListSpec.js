describe('A long time ago in a galaxy far, far away... (Films)', () => {
  beforeEach(() => {
    cy.visit('/')
    cy.request('/films').as('films')
  })

  it('Should get list of Films with success', () => {
    cy.get('@films').should((response) => {
      expect(response.status).to.eq(200)
      expect(response.body).to.have.property('results')
    })
  })

  it('Should get first film properties with success', () => {
    cy.get('@films').should((response) => {
      const firstItem = response.body.results[0]
      expect(firstItem).to.have.property('title')
      expect(firstItem).to.have.property('director')
    })
  })
})
