module MultiProgressBar
  class Bar < DelegateClass(BarRenderer)
    def initialize(title, total)
      BARS << self
      @window = Ncurses::WINDOW.new(1, 0, BARS.index(self), 0)

      @observers = []

      renderer = BarRenderer.new(title, total, @window.getmaxx) do |bar|
        @window.addstr(bar)
        @window.refresh
      end

      super renderer
    end

    def observe(&b)
      @observers << b
    end

    def inc(step = 1)
      super
      notify_observers
    end

    def set(count)
      super
      notify_observers
    end

    private
    def notify_observers
      @observers.each { |b| b.call(self) }
    end
  end
end
