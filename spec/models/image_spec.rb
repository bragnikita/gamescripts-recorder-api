# == Schema Information
#
# Table name: images
#
#  id          :bigint(8)        not null, primary key
#  link        :string(255)
#  type        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  added_by_id :bigint(8)        not null
#
# Indexes
#
#  index_images_on_added_by_id  (added_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (added_by_id => users.id)
#

require 'rails_helper'

RSpec.describe Image, type: :model do

  describe 'common image images/screenshot.png' do
    let(:image) {create(:image, :with_attached_file)}
    it 'is uploaded' do
      expect(image.link.file).to_not be_nil
    end

    after do
      image.link.file.present? && image.link.remove!
    end
  end

  describe 'attach file to image object' do
    let (:image) {create(:image)}
    before do
      File.open(File.expand_path('../../factories/images/screenshot.png', __FILE__)) do |f|
        image.link = f
        image.save!
      end
    end
    it 'is uploaded' do
      expect(image.link.file).to_not be_nil
    end

    after do
      image.link.file.present? && image.link.remove!
    end
  end

  describe 'when model is deleted' do
    let (:image) {build(:image)}
    before do
      File.open(File.expand_path('../../factories/images/screenshot.png', __FILE__)) do |f|
        image.link = f
        image.save!
      end
      @file = image.link.path
    end

    it 'file is deleted' do
      image.reload
      expect(File.exist?(@file)).to be_truthy
      image.destroy
      expect(File.exist?(@file)).to be_falsey
    end

    after do
      image.link && image.link.file.present? && image.link.remove!
    end
  end

end
