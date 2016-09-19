class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role?(:metadmin)
      can :manage, :all
    elsif user.has_role?(:editor)
      can :access, :rails_admin
      can :dashboard
    end


    # cannot :export, :all
    # cannot :create, [Carousel, Location]
    # cannot :edit, Location
    # cannot :destroy, Director
  end
end