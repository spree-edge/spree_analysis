class Spree::SalesTaxReport::MonthlySalesTaxComparisonChart
  def initialize(result)
    @time_dimension = result.time_dimension
    @grouped_by_zone_name = result.observations.group_by(&:zone_name)
    @time_series = []
    if @grouped_by_zone_name.first.present?
      @time_series = @grouped_by_zone_name.values.first.collect { |observation| observation.send(@time_dimension) }
    end
    @chart_series = @grouped_by_zone_name.map do |zone_name, observations|
      { type: 'column', name: zone_name, data: observations.collect(&:sales_tax) }
    end
  end

  def to_h
    {
      id: 'sale-tax',
      json: {
        chart: { type: 'column' },
        title: {
          useHTML: true,
          text: "<span class='chart-title'>Monthly Sales Tax Comparison</span><span class='fa fa-question-circle' data-toggle='tooltip' title='Compare the Sales tax collected from different Zones'></span>"
        },
        xAxis: { categories: @time_series },
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
        series: @chart_series
      }
    }
  end
end
