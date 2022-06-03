module SpreeAnalysis
  module Spree
    module BaseHelperDecorator
      include ::Spree::AnalysisHelper
      include ::WickedPdf::WickedPdfHelper
    end
  end
end

::Spree::BaseHelper.prepend ::SpreeAnalysis::Spree::BaseHelperDecorator
