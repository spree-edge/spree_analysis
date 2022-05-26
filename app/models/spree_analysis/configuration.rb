module SpreeAnalysis
  class Configuration < Spree::Preferences::Configuration
    preference :enabled, :boolean, default: true
    preference :records_per_page, :integer, default: 20
  end
end
