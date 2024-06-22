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
#
class Image < ApplicationRecord
  belongs_to :collection

  enum http_status: {
      unknown: 0,
      found: 1,
      not_found: 404,
    }, _prefix: true

  validates :url, url: { no_local: true }
end
