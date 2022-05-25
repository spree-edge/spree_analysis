module SpreeAnalysis
  module Spree
    module AnalysisHelper

      def selected?(current_analysis, analysis)
        current_analysis.eql?(analysis)
      end
    end
  end
end
