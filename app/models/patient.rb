class Patient < ApplicationRecord
    has_many :appointments
    has_many :physicians, through: :appointments
    

    # def self.search(search)
    # if params[:search]
    #     @patient = Patient.where('name LIKE ?', "%#{params[:search]}%")
    #   else
    #     @patient = Patient.all
    #   end
    # # end
end
