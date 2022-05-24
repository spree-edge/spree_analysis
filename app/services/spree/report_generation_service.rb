module Spree
  class ReportGenerationService

    class << self
      delegate :reports, :report_exists?, :reports_for_category, :default_report_category, to: :configuration
      delegate :configuration, to: SpreeAnalysis::Config
    end
  end
end
