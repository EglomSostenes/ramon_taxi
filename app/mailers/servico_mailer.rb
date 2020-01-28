class ServicoMailer < ApplicationMailer
    default from: 'shoianshun@gmail.com'

    def notificacao_servico(servico) 
        @servico = servico
        mail(to: "eglomsostenes@gmail.com", subject: 'Novo Serviço solicitado')
    end
end