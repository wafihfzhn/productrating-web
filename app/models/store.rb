# == Schema Information
#
# Table name: stores
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Store < ApplicationRecord
  has_many :products
  has_many :reviews

  validates :name, presence: true

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:rating).round(1)
  end
end
