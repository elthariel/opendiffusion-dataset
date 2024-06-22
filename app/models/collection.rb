# frozen_string_literal: true

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

class Collection < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :images, dependent: :destroy

  validates :url, url: { allow_blank: true }
end
