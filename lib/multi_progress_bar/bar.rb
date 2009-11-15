module MultiProgressBar
  class Bar < DelegateClass(BarRenderer)
    abstract

    def initialize(title, total)
      MultiProgressBar.add_bar(self)

      @observers = []

      @renderer = BarRenderer.new(title, total, MultiProgressBar.width) do |rendered_bar|
        MultiProgressBar.update_bar(self, rendered_bar)
      end

      super @renderer
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
