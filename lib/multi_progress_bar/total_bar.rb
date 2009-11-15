module MultiProgressBar
  class TotalBar < Bar
    def initialize(title, bars = MultiProgressBar.bars.dup)
      @bars = bars

      @bars.each do |bar|
        bar.observe do
          update_total
        end
      end

      total_total = @bars.inject(0) { |sum, bar| sum + bar.total }
      super title, total_total
    end

    private
    def update_total
      total_current = @bars.inject(0) { |sum, bar| sum + bar.current }
      @renderer.set(total_current)
    end
  end
end
