class Specialty < ApplicationRecord
  has_many :skills
  has_many :doctors, through: :skills
end
