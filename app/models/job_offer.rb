class JobOffer < ApplicationRecord
    has_many :applications, dependent: :destroy
end
