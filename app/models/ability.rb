class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Food, user_id: user.id
  end
end
