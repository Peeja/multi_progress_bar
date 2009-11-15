module MultiProgressBar
  class TotalBar
    def initialize(title, bars = BARS)
      BARS << self
      @window = Ncurses::WINDOW.new(1, 0, BARS.index(self), 0)

      @bars = bars.reject { |bar| bar == self }

      total_total = @bars.inject(0) { |sum, bar| sum + bar.total }
      @renderer = BarRenderer.new(title, total_total, @window.getmaxx) do |bar|
        @window.addstr(bar)
        @window.refresh
      end

      @bars.each do |bar|
        bar.observe do
          update_total
        end
      end
    end

    private
    def update_total
      total_current = @bars.inject(0) { |sum, bar| sum + bar.current }
      @renderer.set(total_current)
    end
  end
end
