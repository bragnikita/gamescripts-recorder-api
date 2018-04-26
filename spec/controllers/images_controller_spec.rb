require 'rails_helper'

RSpec.describe ImagesController, type: :request do
  describe 'GET /images' do
    it 'should respond with 200'
    it 'should return images list'
  end
  describe 'POST /images' do
    it 'should respond POST /images with 201'
    it 'should return created image id and url'
  end
  describe 'GET /images/:id' do
    it 'should respond with 200'
    it 'should return image url'
  end
  describe 'DELETE /images/:id' do
    it 'should respond with 204'
    it 'should delete image'
  end
  describe 'POST /images/:id/category' do
    it 'should respond with 200'
    it 'should change image category'
  end
end