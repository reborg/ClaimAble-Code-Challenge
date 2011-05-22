class Customer
  include Mongoid::Document
  field :name, :type => String
  field :postcode, :type => String
  field :phone, :type => String
  field :dob, :type => Date
  referenced_in :claim
end
