class User < ApplicationRecord
  validates :nome,
            presence: { message: 'Campo nome não pode ficar em branco' }
  validates :cpf,
            presence: { message: 'Campo CPF não pode ficar em branco' },
            uniqueness: { message: 'CPF já cadastrado' }
  validates :email,
            presence: { message: 'Campo email não pode ficar em branco' },
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                      message: 'Email com formato invalido' }
end
