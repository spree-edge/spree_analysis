class Spree::ShippingCostReport::ShippingCostDistributionChart


  def initialize(result)
    time_dimension = result.time_dimension
    @grouped_by_shipping_method = result.observations.group_by(&:name)
    @time_series = []
    @time_series = @grouped_by_shipping_method.values.first.collect { |observation_value| observation_value.send(time_dimension) } if @grouped_by_shipping_method.first.present?
    @result_series = @grouped_by_shipping_method.collect { |name, observations| { name: name, data: observations.collect(&:shipping_cost_percentage) } }
  end

  def to_h
    {
      id: 'shipping-cost-percentage-comparison',
      json: {
        chart: { type: 'spline' },
        title: {
          useHTML: true,
          text: "<span class='chart-title'>Monthly Shipping Comparison</span><span class='fa fa-question-circle' data-toggle='tooltip' title='Compare the Shipping percentage (calculated on Revenue) among various shipment methods such as UPS, FedEx etc.'></span>"
        },
        xAxis: { categories: @time_series },
        yAxis: {
          title: { text: 'Percentage(%)' }
        },
        tooltip: { valueSuffix: '%' },
        legend: {
          layout: 'vertical',
          align: 'right',
          verticalAlign: 'middle',
          borderWidth: 0
        },
        series: @result_series
      }
    }

  end

end
