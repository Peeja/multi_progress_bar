require 'ncurses'
require 'progressbar'
require 'delegate'

module MultiProgressBar
  class << self
    attr_reader :bars

    # Set up the screen.  Always call +MultiProgressBar.start+ before using progress bars.
    def start
      @bars = [].freeze

      Ncurses.initscr
      Ncurses.curs_set(0)

      @bars_window = Ncurses::WINDOW.new(1, 0, Ncurses.LINES-1, 0)
      @log_window  = Ncurses::WINDOW.new(Ncurses.LINES-1, 0, 0, 0)
      @log_window.scrollok(true)
    end

    # Restore the terminal to normal function.  Always call this before exiting.
    def end
      Ncurses.endwin
      puts
    end

    # Write +text+ to the space above the progress bars.
    def log(text)
      @log_window.addstr("#{text}\n")
      @log_window.refresh
    end

    def width  #:nodoc:
      @bars_window.getmaxx
    end

    def add_bar(bar)  #:nodoc:
      @bars += [bar]

      @bars_window.mvwin(Ncurses.LINES-bars.size, @bars_window.getbegx)
      @bars_window.resize(bars.size, @bars_window.getmaxx)
      @bars_window.refresh

      @log_window.resize(Ncurses.LINES-bars.size, @log_window.getmaxx)
      @log_window.refresh
    end

    def update_bar(bar, rendered_bar)  #:nodoc:
      @bars_window.move(bars.index(bar), 0)
      @bars_window.addstr(rendered_bar)
      @bars_window.refresh
    end
  end
end

require 'multi_progress_bar/bar_renderer'
require 'multi_progress_bar/bar'
require 'multi_progress_bar/total_bar'
