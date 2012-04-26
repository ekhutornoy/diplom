# -*- coding: utf-8 -*-
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      # Если пользователь-админ, ему можно всё
      can :manage, :all
    else
      # Просматривать остатки, приходы, продажи и товары могут все
      can :read, [Stock, Income, SaleOrder, Product]

      if user.has_permission?(:incomes)
        can :create, Income
        can :manage, Income, :user_id => user.id
      end

      if user.has_permission?(:company_incomes)
        can :manage, Income
      end

      if user.has_permission?(:sale_orders)
        can :create, SaleOrder
        can :manage, SaleOrder, :user_id => user.id
      end

      if user.has_permission?(:company_sale_orders)
        can :manage, SaleOrder
      end

      if user.has_permission?(:products)
        can :manage, Product
      end

      if user.has_permission?(:departments)
        can :manage, Department
      end

      if user.has_permission?(:company_users)
        can :manage, User
      end
    end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
