require 'carrierwave/test/matchers'

describe ImagesUploader do
  include CarrierWave::Test::Matchers

  let(:image) { build(:image) }
  let(:uploader) { ImagesUploader.new(image, :link)}

  before do
    ImagesUploader.enable_processing = true
    File.open(File.join(__FILE__, 'files', 'image.png')) { |f| uploader.store!(f) }
  end

  after do
    ImagesUploader.enable_processing = false
    uploader.remove!
  end

end