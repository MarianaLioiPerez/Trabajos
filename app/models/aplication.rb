class Aplication < ApplicationRecord
  belongs_to :job_offer
  belongs_to :tuser

  validates :text, presence: true
end
