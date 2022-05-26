module Spree::Report::DateSlicer
  def self.slice_into(start_date, end_date, time_scale, klass)
    case time_scale
    when :hourly
      slice_hours_into(start_date, end_date, klass)
    when :daily
      slice_days_into(start_date, end_date, klass)
    when :monthly
      slice_months_into(start_date, end_date, klass)
    when :yearly
      slice_years_into(start_date, end_date, klass)
    end
  end

  def self.slice_hours_into(start_date, end_date, klass)
    current_date = start_date
    slices = []
    while current_date <= end_date
      slices << (0..23).collect do |hour|
        obj = klass.new
        obj.date = current_date
        obj.hour = hour
        obj
      end
      current_date = current_date.next_day
    end
    slices.flatten
  end

  def self.slice_days_into(start_date, end_date, klass)
    current_date = start_date
    slices = []
    while current_date <= end_date
      obj = klass.new
      obj.date = current_date
      slices << obj
      current_date = current_date.next_day
    end
    slices
  end

  def self.slice_months_into(start_date, end_date, klass)
    current_date = start_date
    slices = []
    while current_date <= end_date
      obj = klass.new
      obj.date = current_date
      slices << obj
      current_date = current_date.end_of_month.next_day
    end
    slices
  end

  def self.slice_years_into(start_date, end_date, klass)
    (start_date.year..end_date.year).collect do |year|
      obj = klass.new
      obj.date = Date.new(year).end_of_year
      obj
    end
  end
end
