module Spree
  module PromotionActionDecorator
    def self.prepended(base)
      base.has_one :adjustment, -> { promotion }, class_name: 'Spree::Adjustment', foreign_key: :source_id
    end

    ::Spree::PromotionAction.prepend self
  end
end
