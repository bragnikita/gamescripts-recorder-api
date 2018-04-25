require 'carrierwave/test/matchers'
require 'rails_helper'

describe 'ImagesUploader' do
  include CarrierWave::Test::Matchers

  let(:image) { create(:image) }
  let(:uploader) { ImagesUploader.new(image, :link)}
  let(:subject) { Rails.root.join('public', 'uploads', 'images', 'common', image.id.to_s, 'screenshot.png' ) }

  before do
    ImagesUploader.enable_processing = true
    File.open(File.expand_path('../files/screenshot.png', __FILE__)) { |f| uploader.store!(f) }
  end

  after do
    ImagesUploader.enable_processing = false
    uploader.remove!
  end

  context 'screenshot.png has been uploaded and ' do
    it 'exists' do
      expect(File.exist?(uploader.path)).to be_truthy
    end
    it 'placed in <root>/images/common/<id>/screenshot.png' do
      expect(uploader.path).to match(/\/images\/common\/\d+\/screenshot\.png$/)
    end
    it 'is equal to original screenshot.png' do
      expect(uploader.path).to be_identical_to(File.expand_path('../files/screenshot.png', __FILE__))
    end
  end

end