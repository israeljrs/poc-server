class Order < ApplicationRecord
  belongs_to :user
  validates :model,
            presence: { message: 'Campo modelo não pode ficar em branco' }
  validates :vrl_year,
            presence: { message: 'Campo valor não pode ficar em branco' }
end
