class AddUniqueConstraintToImageUrl < ActiveRecord::Migration[7.1]
  def change
    add_unique_constraint :images, [:url], deferrable: :deferred
  end
end
