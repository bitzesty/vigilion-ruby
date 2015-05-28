module VirusScanner
  class Error < StandardError
    def initialize(statement)
      if statement.is_a?(Exception)
        @error = statement
      else
        @message = statement
      end
    end

    def message
      @message || "#{@error.class} (wrapped in #{self.class}) - #{@error.message}"
    end

    def backtrace
      if @error
        error_backtrace = ["--- Backtrace from #{@error.class} ---"] + (@error.backtrace || [])
        wrapper_backtrace = ["--- Backtrace from #{self.class} ---"] + (super || [])
        error_backtrace + wrapper_backtrace
      else
        super
      end
    end

    def inspect
      if @error
        "#{error.inspect} (wrapped in a #{self.class})"
      else
        super
      end
    end

    def to_s
      if @error
        "#{@error.class} (wrapped in a #{self.class}) - #{@error}"
      else
        super
      end
    end
  end

  class HTTPError < Error; end
end
