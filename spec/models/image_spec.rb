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
require 'rails_helper'

RSpec.describe Image, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
