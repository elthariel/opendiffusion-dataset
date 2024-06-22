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
Fabricator(:collection) do
  transient :seq

  seq { Fabricate.sequence :collection }

  name        { |attrs| "Collection-#{attrs[:seq]}" }
  url         { |attrs| "http://example.com/collection/#{attrs[:seq]}" }
  description { FFaker::Lorem.paragraph }
end
