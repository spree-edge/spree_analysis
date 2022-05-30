module Spree
  class Report
    class TimedResult < Result

      def build_report_observations
        query_results
        build_empty_observations
        populate_observations
      end

      def build_empty_observations
        @observations = Spree::Report::DateSlicer.slice_into(start_date, end_date, time_scale, self.class::Observation)
      end

      def populate_observations
        @results.each do |result|
          matching_observation = @observations.find { |observation| observation.describes? result, time_scale }
          matching_observation.populate result
        end
      end

      def headers
        [time_headers] + super
      end

      private def time_headers
        {
          name: Spree.t(time_dimension, scope: [:admin]),
          value: time_dimension,
          type: :string,
          sortable: false
        }
      end
    end
  end
end
