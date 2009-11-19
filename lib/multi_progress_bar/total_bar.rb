module MultiProgressBar
  # Works just like +Bar+, but displays the total of other bars.
  # TotalBar#inc and TotalBar#set don't work.
  class TotalBar < Bar
    # Create a new TotalBar.  +bars+ is an array of Bar objects, and defaults to
    # all existing bars.
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

    [:inc, :set].each do |name|
      define_method(name) do
        raise NoMethodError, "NoMethodError: private method `#{name}' called for #{self}"
      end
    end

    private
    def update_total
      total_current = @bars.inject(0) { |sum, bar| sum + bar.current }
      total_total   = @bars.inject(0) { |sum, bar| sum + bar.total }
      finished      = @bars.all? { |bar| bar.finished? }
      @renderer.total = total_total
      @renderer.set(total_current)
      @renderer.finish if finished
    end
  end
end
