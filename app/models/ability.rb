# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    
      if user.admin?
        can :manage, :all
      else
        can [:descricao, :pagina_inicial, :create], Servico
        cannot :manage, User
      end
  end
end
