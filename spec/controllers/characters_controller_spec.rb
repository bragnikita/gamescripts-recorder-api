require 'rails_helper'

RSpec.describe 'CharactersController', type: :request do
  describe 'GET /characters' do
    describe 'GET /characters'
    describe 'GET /characters?name='
    describe 'GET /characters?scope='
  end
  describe 'GET /characters/:id' do

  end
  describe 'POST /characters' do

  end
  describe 'DELETE /character/:id' do
    it 'user is not owner - does not delete'
    it 'is in other lists - does not delete'
    it 'does not get in any list or script - can be deleted'
  end
  describe 'PATCH /character/:id' do
    it 'user is not owner - does not update'
    it 'updates main parameters'
    it 'adds new scope'
    it 'removes scope'
  end
end