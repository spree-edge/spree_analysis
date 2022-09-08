class Spree::SalesPerformanceReport::ProfitLossChart
  def initialize(result)
    time_dim = result.time_dimension
    @time_series = result.observations.collect(&time_dim)
    @data = result.observations.collect(&:profit_loss)
  end

  def to_h
    {
      id: 'profit-loss',
      json: {
        title: {
          useHTML: true,
          text: "<span class='chart-title'>Profit/Loss</span><span class='fa fa-question-circle' data-toggle='tooltip' title='Track the profit or loss value'></span>"
        },
        xAxis: { categories: @time_series },
        yAxis: {
          title: { text: 'Value($)' }
        },
        legend: {
          layout: 'vertical',
          align: 'right',
          verticalAlign: 'middle',
          borderWidth: 0
        },
        series: [
          {
            name: 'Profit Loss',
            tooltip: { valuePrefix: '$' },
            data: @data
          }
        ]
      }
    }
  end
end
