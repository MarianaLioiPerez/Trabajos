class Tuser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :applications, dependent: :destroy

         def admin?
          admin
        end

        def self.admin_creation_params
          %i[email password password_confirmation admin]
        end
end
