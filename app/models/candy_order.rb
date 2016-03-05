class CandyOrder < ActiveRecord::Base
  belongs_to :candy
  belongs_to :order
end
