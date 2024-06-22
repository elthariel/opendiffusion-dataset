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
Fabricator(:image_base, class_name: 'Image') do
  url { FFaker::Image.url }
end

Fabricator(:image) do
  collection
end
