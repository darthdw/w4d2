# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  validates :status, :start_date, :end_date, :cat_id, presence: true
  validates :status, inclusion: { in: ['PENDING','APPROVED','DENIED'] }

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat

  def overlapping_requests
    test = CatRentalRequest.select('*').joins('cats')
                           .where("cats.id = cat_id")
    p test
  end

end
