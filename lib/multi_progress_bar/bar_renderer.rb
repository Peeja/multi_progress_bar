module MultiProgressBar
  class BarRenderer < ProgressBar  #:nodoc:
    attr_writer :title

    def initialize(title, total, width, &block)
      @block = block
      @buffer = StringIO.new
      @width = width
      super(title, total, @buffer)
    end

    def show
      super
      @block.call(@buffer.string)
      @buffer.string = ""
    end

    def get_width
      @width
    end
  end
end
