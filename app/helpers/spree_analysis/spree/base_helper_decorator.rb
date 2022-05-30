module SpreeAnalysis
  module Spree
    module BaseHelperDecorator
      include ::Spree::AnalysisHelper
    end
  end
end

::Spree::BaseHelper.prepend ::SpreeAnalysis::Spree::BaseHelperDecorator
