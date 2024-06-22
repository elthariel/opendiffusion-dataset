# == Schema Information
#
# Table name: images
#
#  id            :uuid             not null, primary key
#  http_status   :integer          default("unknown"), not null
#  pinged_at     :datetime
#  url           :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  collection_id :bigint           not null
#
# Indexes
#
#  index_images_on_collection_id  (collection_id)
#  uniq_rails_0b1e038289          (url) UNIQUE
#
require 'rails_helper'

RSpec.describe Image, type: :model do
  subject { Fabricate :image }

  describe 'ImagePinger' do
    it 'is called after creation' do
      expect(ImagePingerJob).to receive(:perform_async)
      subject
    end

    it 'is called after creation' do
      subject
      expect(ImagePingerJob).to receive(:perform_async)
      subject.update(url: 'http://example.com')
    end

    it "is not called if url wasn't touched" do
      subject
      expect(ImagePingerJob).not_to receive(:perform_async)
      subject.update(http_status: 0)
    end
  end
end
