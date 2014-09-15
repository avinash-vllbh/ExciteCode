class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    # To use in future, since manage would mean user cando anything with the object
    # alias_action :create, :read, :update, :destroy, :to => :crud
    if user.admin == true
        can :manage, :all
    else
      cannot [:create, :update, :destroy], Blog
      can :read, Blog, :published => true
      can :manage, Comment, :user_id => user.id
      can :read, [Blog, Category, Comment, Project]
    end
  end
end
