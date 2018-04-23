require 'rails_helper'
# include RSpec::Mocks::ArgumentMatchers

RSpec.describe UsersController, type: :request do
  describe 'index()' do
    it 'gets the list of all registered users' do
      create(:user, :username => 'foo')
      create(:user, :username => 'bar')
      get "/users"
      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(200)
      expect(getBody[:collection]).to have_exactly(2).items
      expect(getBody[:collection]).to include include({:id => anything, :username => 'foo'})
      expect(getBody[:collection]).to include include({:id => anything, :username => 'bar'})
    end
  end
  describe 'create()' do
    it 'creates new user' do
      post "/users", params: {:user => {:username => 'foo', :password => 'password'}}
      expect(response).to have_http_status(:created)
      expect(getBody)
          .to match(
                  :object => {
                      :id => be_a(Numeric)
                  }
              )
    end
    it 'returns validation error if username is already exists' do
      create(:user, :username => 'foo')
      post "/users", params: {:user => {:username => 'foo', :password => 'password'}}
      expect(response).to have_http_status(:unprocessable_entity)
      expect(getBody)
      .to match(
              :message => 'Validation error',
              :errors => {
                  :username => have(1).items
              }
          )
    end
    it 'returns validation error if password is not filled' do
      post "/users", params: {:user => {:username => 'foo', :password => ''}}
      expect(response).to have_http_status(:unprocessable_entity)
      expect(getBody)
          .to match(
                  :message => 'Validation error',
                  :errors => {
                      :password => have(1).items
                  }
              )
    end
  end
  describe 'update()' do
    it 'updates email' do
      user = create(:user, :username => 'foo', :password => 'pw', :email => 'example@mail.com')
      put "/users/#{user.id}", params: {:user => {:email => 'new@mail.com'}}
      expect(response).to have_http_status(:ok)
      expect(getBody[:object]).to be_truthy
      expect(getBody[:object]).to a_hash_including(:id => user.id, :email => 'new@mail.com')
      expect(User.find(user.id).email).to eq('new@mail.com')
    end
  end
end

def getBody
  JSON.parse(response.body, :symbolize_names => true)
end
