class Contact < ActiveRecord::Base
  # add validation
  validates :name, :company, :contactphone, :telegram, :whatsapp, :viber, :history, presence: true
end
