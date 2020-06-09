# == Schema Information
#
# Table name: reviews
#
#  id          :bigint           not null, primary key
#  comment     :string
#  rating      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  product_id  :bigint           not null
#  purchase_id :bigint
#  store_id    :bigint           not null
#
# Indexes
#
#  index_reviews_on_product_id   (product_id)
#  index_reviews_on_purchase_id  (purchase_id)
#  index_reviews_on_store_id     (store_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (purchase_id => purchases.id)
#  fk_rails_...  (store_id => stores.id)
#
class Review < ApplicationRecord
  belongs_to :purchase
  belongs_to :store
  belongs_to :product

  validates :rating, presence: true, numericality: { only_integer: true }
  validates :comment, presence: true

  validate :rating_within_limit
  
  def rating_within_limit
    # TODO: Implement validation logic for `rating`
    # - Rating cannot be greater than 5
    # - Rating cannot be a negative number
    # - Handle any potential error/crash
    if rating > 5
      errors.add(:rating, 'Rating cannot be greater than 5')
    elsif rating < 0
      errors.add(:rating, 'Rating cannot be a negative number')
    end
  end
end
