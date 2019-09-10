class Physician < ApplicationRecord
    has_many :appointments
    has_many :articles
    has_many :patients, through: :appointments
end
