
class Ability < ApplicationRecord

  def initialize(tuser)
    tuser ||= Tuser.new

    if tuser.admin?
      can :manage, :all
    else
      can :read, :all
      # Define las capacidades específicas según tus necesidades
    end
  end

end
  