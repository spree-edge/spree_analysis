module Spree
  module UserDecorator
    def self.prepended(base)
      base.has_many :spree_orders, class_name: 'Spree::Order'
    end

    ::Spree::User.prepend self
  end
end
