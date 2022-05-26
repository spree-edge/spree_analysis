module Spree::Report::QueryTimeScale

  def self.select_with_column_name(time_scale, time_scale_on, column_name)
    db_col_name = "#{ time_scale_on }.#{ column_name }"
    time_scale_columns(time_scale).collect { |time_scale_column| ::Spree::Report::QueryFragments.public_send(time_scale_column, db_col_name) }
  end

  def self.select(time_scale, time_scale_on)
    db_col_name = time_scale_on.present? ? "#{ time_scale_on }.created_at" : "created_at"
    time_scale_columns(time_scale).collect { |time_scale_column| ::Spree::Report::QueryFragments.public_send(time_scale_column, db_col_name) }
  end

  def self.time_scale_columns(time_scale)
    case time_scale
    when :hourly
      [:day, :hour]
    when :daily
      [:month, :day]
    when :monthly
      [:year, :month]
    when :yearly
      [:year]
    end
  end
end
