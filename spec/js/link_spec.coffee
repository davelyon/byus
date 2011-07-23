require '/assets/underscore-dev.js'
require '/assets/backbone-dev.js'
require '/assets/models/link.js'

describe "Link", ->
  beforeEach ->
    @link = new Link
      title: 'Imma Title'
  it "creates a link from given data", ->
    expect(@link.get('title')).toEqual('Imma Title')
  describe "with long title", ->
    beforeEach ->
      @link = new Link
        title: '1111111111111111111111111111111111111111111111111111111111111'
    it "truncates title to 60 characters", ->
      expect(@link.get('title')).toEqual('111111111111111111111111111111111111111111111111111111111...')
