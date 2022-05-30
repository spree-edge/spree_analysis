module Spree
  class ReportGenerationService

    class << self
      delegate :reports, :report_exists?, :reports_for_category, :default_report_category, to: :configuration
      delegate :configuration, to: SpreeAnalysis::ReportConfig
    end

    def self.generate_report(report_name, options)
      klass = Spree.const_get((report_name.to_s + '_report').classify)
      resource = klass.new(options)
      dataset = resource.generate
    end

    def self.download(report, options = {})
      headers = report.headers
      stats = report.observations
      ::CSV.generate(options) do |csv|
        csv << headers.map { |head| head[:name] }
        stats.each do |record|
          csv << headers.map { |head| record.public_send(head[:value]) }
        end
      end
    end
  end
end
