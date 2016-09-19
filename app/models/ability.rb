class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role?(:admin)
      can :manage, :all
    elsif user.has_role?(:editor)
      can :access, :rails_admin
      can :dashboard
      can :read, :all
    else if user.has_role?(:user)
      can :read, :all
    end
    # cannot :export, :all
    # cannot :create, [Carousel, Location]
    # cannot :edit, Location
    # cannot :destroy, Director
  end
end