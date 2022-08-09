class Spree::SalesPerformanceReport::ProfitLossPercentChart
  def initialize(result)
    time_dim = result.time_dimension
    @time_series = result.observations.collect(&time_dim)
    @data = result.observations.collect(&:profit_loss_percent)
  end

  def to_h
    {
      id: 'profit-loss-percent',
      json: {
        title: {
          useHTML: true,
          text: "<span class='chart-title'>Profit/Loss %</span><span class='fa fa-question-circle' data-toggle='tooltip' title='Track the profit or loss %age to create a projection'></span>"
        },
        xAxis: { categories: @time_series },
        yAxis: {
          title: { text: 'Percentage(%)' }
        },
        legend: {
          layout: 'vertical',
          align: 'right',
          verticalAlign: 'middle',
          borderWidth: 0
        },
        series: [
          {
            name: 'Profit Loss Percent(%)',
            tooltip: { valueSuffix: '%' },
            data: @data
          }
        ]
      }
    }
  end
end
