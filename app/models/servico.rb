class Servico < ApplicationRecord
    validates :nome, presence: { message: "obrigatório" }
    validates :email, presence: { message: "obrigatório" }
    validates :fone, presence: { message: "obrigatório" }
end
