class Spree::PromotionalCostReport::PromotionalCostChart
  attr_accessor :time, :series

  def initialize(result)
    @grouped_by_promotion = result.observations.group_by(&:promotion_name)
    @time_dimension = result.time_dimension
    self.time = []
    self.time =   @grouped_by_promotion.values.first.collect { |observation_value| observation_value.send(@time_dimension) } if @grouped_by_promotion.first.present?
    self.series = @grouped_by_promotion.collect { |promotion, values| { type: 'column', name: promotion, data: values.collect(&:promotion_discount) }  }
  end

  def to_h
    {
      id: 'promotional-cost',
      json: {
        chart: { type: 'column' },
        title: {
          useHTML: true,
          text: "<span class='chart-title'>Promotional Cost</span><span class='fa fa-question-circle' data-toggle='tooltip' title=' Compare the costing for various promotions'></span>"
        },
        xAxis: { categories: time },
        yAxis: {
          title: { text: 'Value($)' }
        },
        tooltip: { valuePrefix: '$' },
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
