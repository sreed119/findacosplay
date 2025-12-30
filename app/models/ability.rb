class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin_role?
      can :manage, Item
      can :manage, Medium
      can :manage, Character
      can :manage, User
      can :manage, CharacterItem
      can :manage, UserMedium do |um|
        um.user_id == user.id
      end
      can :manage, UserCharacter do |uc|
        uc.user_id == user.id
      end
      can :manage, UserItem do |ui|
        ui.user_id == user.id
      end
    elsif user.user_role?
      can :manage, Item
      can :manage, Medium
      can :manage, Character
      can :manage, CharacterItem
      can :show, User do |u|
        u.id == user.id
      end
      can :update, User do |u|
        u.id == user.id
      end
      can :destroy, User do |u|
        u.id == user.id
      end
      can :manage, UserMedium do |um|
        um.user_id == user.id
      end
      can :manage, UserCharacter do |uc|
        uc.user_id == user.id
      end
      can :manage, UserItem do |ui|
        ui.user_id == user.id
      end
    end

    can :read, Item
    can :read, Medium
    can :read, Character
    can :create, User
  end
end
