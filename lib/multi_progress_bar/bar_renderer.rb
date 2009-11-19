module MultiProgressBar
  class BarRenderer < ProgressBar  #:nodoc:
    attr_writer :total

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

    def title=(new_title)
      @title = new_title
      show
    end

    def get_width
      @width
    end

    def restart
      set(0)
      @start_time = Time.now
      @previous_time = @start_time
    end

    def do_percentage
      if @current.zero?
        0
      else
        super
      end
    end
  end
end
