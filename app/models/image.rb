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
class Image < ApplicationRecord
  belongs_to :collection

  enum http_status: {
      unknown: 0,
      **Rack::Utils::SYMBOL_TO_STATUS_CODE
    }, _prefix: true

  validates :url, url: { no_local: true }

  after_save :ping

  scope :latest, -> { order(created_at: :desc) }

  protected

  def ping
    ImagePingerJob.perform_async id if url_previously_changed?
  end
end
