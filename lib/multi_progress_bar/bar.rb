module MultiProgressBar
  class Bar < DelegateClass(BarRenderer)
    BARS = []

    def initialize(title, total)
      BARS << self
      @window = Ncurses::WINDOW.new(1, 0, BARS.index(self), 0)

      renderer = BarRenderer.new(title, total, @window.getmaxx) do |bar|
        @window.addstr(bar)
        @window.refresh
      end

      super renderer
    end
  end
end
