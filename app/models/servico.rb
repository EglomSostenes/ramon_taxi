class Servico < ApplicationRecord
    validates :nome, presence: { message: "obrigatório" }
    validates :email, presence: { message: "obrigatório" }
    validates :fone, presence: { message: "obrigatório" }

    enum status: [:finalizado, :ativo, :cancelado]

    def verifica_status
        if status == 'finalizado'
            return false
        end
        if status == 'cancelado'
            return false
        end
        if inicio >= DateTime.now
            update_columns(status: 'ativo')
            return true
        else
            if DateTime.now > fim
                update_columns(status: 'finalizado')
                return false
            else
                update_columns(status: 'ativo')
                return true
            end
        end
    end
end
