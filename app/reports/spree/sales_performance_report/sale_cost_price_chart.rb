class Spree::SalesPerformanceReport::SaleCostPriceChart
  def initialize(result)
    time_dim = result.time_dimension
    @time_series = result.observations.collect(&time_dim)
    @sale_price = result.observations.collect(&:sale_price)
    @cost_price = result.observations.collect(&:cost_price)
    @promotion_discount = result.observations.collect(&:promotion_discount)
  end

  def to_h
    {
      id: 'sale-price',
      json: {
        chart: { type: 'column' },
        title: {
          useHTML: true,
          text: "<span class='chart-title'>Sales Performance %</span><span class='fa fa-question-circle' data-toggle='tooltip' title='Compare the Selling price, cost price and promotional cost over a period of time'></span>"
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
        series: [
          {
            name: 'Sale Price',
            data: @sale_price
          },
          {
            name: 'Cost Price',
            data: @cost_price
          },
          {
            name: 'Promotional Cost',
            data: @promotion_discount
          }
        ]
      }
    }
  end
end
