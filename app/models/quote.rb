class Quote < ApplicationRecord
    validates :business, :presence => true
    validates :fullname, :presence => true
    validates :email, :presence => true
end
