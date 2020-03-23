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
  validate :validate_cpf

  def validate_cpf
    if !check_cpf(cpf)
      errors.add(:cpf, 'CPF invalido, favor tentar novamente !!!')
    end
  end

  private
  def check_cpf(cpf=nil)
    return false if cpf.nil?
    winvalidos = %w{12345678909 11111111111 22222222222 33333333333 44444444444 55555555555 66666666666 77777777777 88888888888 99999999999 00000000000}
    wvalor = cpf.scan /[0-9]/
    if wvalor.length == 11
      unless winvalidos.member?(wvalor.join)
        wvalor = wvalor.collect{|x| x.to_i}
        wsoma = 10*wvalor[0]+9*wvalor[1]+8*wvalor[2]+7*wvalor[3]+6*wvalor[4]+5*wvalor[5]+4*wvalor[6]+3*wvalor[7]+2*wvalor[8]
        wsoma = wsoma - (11 * (wsoma/11))
        wresult1 = (wsoma == 0 or wsoma == 1) ? 0 : 11 - wsoma
        if wresult1 == wvalor[9]
          wsoma = wvalor[0]*11+wvalor[1]*10+wvalor[2]*9+wvalor[3]*8+wvalor[4]*7+wvalor[5]*6+wvalor[6]*5+wvalor[7]*4+wvalor[8]*3+wvalor[9]*2
          wsoma = wsoma - (11 * (wsoma/11))
          wresult2 = (wsoma == 0 or wsoma == 1) ? 0 : 11 - wsoma
          return true if wresult2 == wvalor[10] # CPF validado
        end
      end
    end
    return false # CPF invalidado
  end
end
