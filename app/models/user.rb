# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  PERMISSIONS = {
    :incomes             => 'Свои приходы',
    :company_incomes     => 'Приходы других сотрудников',
    :sale_orders         => 'Свои продажи',
    :company_sale_orders => 'Продажи других сотрудников',
    :products            => 'Справочник товаров и категорий',
    :departments         => 'Справочник складов',
    :company_users       => 'Сотрудники компании'
  }

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :company_id, :admin, :company_attributes, :name, :permissions
  # attr_accessible :title, :body
  belongs_to :company
  accepts_nested_attributes_for :company
  has_many :incomes
  has_many :sale_orders

  def permissions=(permissions)
    self.permissions_mask =
      (permissions.map(&:to_sym) & PERMISSIONS.keys).map {
        |r| 2**PERMISSIONS.keys.index(r)
      }.sum
  end

  def permissions
    PERMISSIONS.keys.reject do |r|
      ((permissions_mask || 0) & 2**PERMISSIONS.keys.index(r)).zero?
    end
  end

  def has_permission?(permission)
    permissions.include?(permission)
  end
end
