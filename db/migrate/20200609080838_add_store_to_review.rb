class AddStoreToReview < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :store, null: false, foreign_key: true
  end
end
