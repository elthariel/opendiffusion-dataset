# == Schema Information
#
# Table name: collections
#
#  id          :uuid             not null, primary key
#  description :text
#  name        :string
#  slug        :string           not null
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_collections_on_slug  (slug) UNIQUE
#
require 'rails_helper'

RSpec.describe Collection, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
