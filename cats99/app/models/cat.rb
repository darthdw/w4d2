# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birthdate   :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# require 'ActionView'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  COLORS = ['white', 'black', 'tabby', 'calico', 'orange']
  validates :color, :name, :sex, :description, :birthdate, presence: true
  validates :sex, inclusion: { in: ['m', 'f'] }
  validates :color, inclusion: { in: COLORS }

  def age
    time_ago_in_words(birthdate)
  end

  has_many :cat_rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy

end
