class Spree::Report::Configuration
  attr_accessor :default_report_category, :default_report
  attr_reader :reports

  def initialize
    @reports = {}
  end

  def register_report_category(category)
    @reports[category] = []
  end

  def register_report(category, report_name)
    @reports[category] << report_name
  end

  def report_exists?(category, name)
    @reports.key?(category) && @reports[category].include?(name)
  end

  def reports_for_category(category)
    if category_exists? category
      @reports[category]
    else
      []
    end
  end

  def default_report_category
    @default_report_category || @reports.keys.first
  end

  def default_report
    @default_report || @reports[default_report_category].first
  end

  def category_exists?(category)
    @reports.key? category
  end
end
