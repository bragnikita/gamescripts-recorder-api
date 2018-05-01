require 'rails_helper'

RSpec.describe ImagesController, type: :request do
  describe 'GET /images' do
    before :all do
      create(:common_image)
      create(:common_image)
      get "/images"
    end

    it 'should respond with 200' do
      expect(response).to have_http_status(:ok)
    end
    it 'should return images list' do
      expect(getBody[:collection]).to have(2).items
      expect(response.body)
          .to include_json(
                  collection: UnorderedArray(
                      {id: be_a(Numeric), url: be_a(String)}
                  )
              )
    end
  end
  describe 'POST /images' do
    before :all do
      file = fixture_file_upload('/images/screenshot.png', 'image/png')
      post '/images', :params => {:image => {:content => file, :category => 'picture'}}
    end
    it 'should respond POST /images with 201' do
      expect(response).to have_http_status(201)
    end
    it 'should return created image id and url' do
      expect(getBody).to a_hash_including(
                             :object => {
                                 :id => be_a(Numeric),
                                 :url => be_a(String)
                             }
                         )
    end
  end
  describe 'GET /images/:id' do
    let (:image) {
      create(:common_image)
    }
    before do
      get '/images/' + image.id.to_s
    end
    it 'should respond with 200' do
      expect(response).to have_http_status(:ok)
    end
    it 'should return image url' do
      expect(response.body).to include_json(
                                   object: {
                                       id: image.id,
                                       url: image.link.url
                                   }
                               )
    end
  end
  describe 'DELETE /images/:id' do
    before :all do
      @image = create(:common_image)
      delete "/images/#{@image.id}"
    end
    it 'should respond with 204' do
      expect(response).to have_http_status(:no_content)
    end
    it 'should delete image' do
      expect(Image.exists?(@image.id)).to be_falsey
    end
  end
  describe 'PATCH /images/:id' do
    let(:image) {
      create(:common_image)
    }
    before do
      patch "/images/#{image.id}", params: { image: {category: 'avatar'}}
    end
    it 'should respond with 200' do
      expect(response).to have_http_status(:ok)
    end
    it 'should return updated object' do
      expect(response.body).to include_json(
                                   object: {
                                       id: image.id,
                                       url: be_a(String),
                                       category: 'avatar'
                                   }
                               )
    end
    it 'should change image category' do
      updated_image = Image.find(image.id)
      expect(updated_image.category).to eq('avatar')
    end
  end
  after :each do |example|
    if example.exception
      if @response && @response.body
        puts JSON.parse(@response.body)
      end
    end
  end
end

def getBody
  JSON.parse(response.body, :symbolize_names => true)
end