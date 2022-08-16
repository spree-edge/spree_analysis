class Spree::PromotionalCostReport::UsageCountChart

  attr_accessor :time, :series

  def initialize(result)
    @grouped_by_promotion = result.observations.group_by(&:promotion_name)
    @time_dimension = result.time_dimension
    self.time = []
    if @grouped_by_promotion.values.first.present?
      self.time   = @grouped_by_promotion.values.first.collect { |observation_value| observation_value.send(@time_dimension) }
    end
    self.series = @grouped_by_promotion.collect { |promotion, values| { type: 'column', name: promotion, data: values.collect(&:usage_count) }  }
  end


  def to_h
    {
      id: 'promotion-usage-count',
      json: {
        chart: { type: 'spline' },
        title: {
          useHTML: true,
          text: "<span class='chart-title'>Promotion Usage Count</span><span class='fa fa-question-circle' data-toggle='tooltip' title='Compare the usage of individual promotions'></span>"
        },
        xAxis: { categories: time },
        yAxis: {
          title: { text: 'Count' }
        },
        tooltip: { valuePrefix: '#' },
        legend: {
          layout: 'vertical',
          align: 'right',
          verticalAlign: 'middle',
          borderWidth: 0
        },
        series: series
      }
    }
  end

end
