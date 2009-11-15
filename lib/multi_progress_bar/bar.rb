module MultiProgressBar
  class Bar < DelegateClass(BarRenderer)
    def initialize(title, total)
      @window = Ncurses::WINDOW.new(1, 0, 0, 0)

      renderer = BarRenderer.new(title, total, @window.getmaxx) do |bar|
        @window.addstr(bar)
        @window.refresh
      end

      super renderer
    end
  end
end
