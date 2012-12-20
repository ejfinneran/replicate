require 'base64'
require 'stringio'

module Replicate
  class Serializer < StringIO
    attr_accessor :write_to, :mode

    def write_to
      @write_to ||= STDOUT
    end

    def flush
      write_to.puts(self.string)
    end

    def string
      if mode == :base64
        Base64.strict_encode64(super)
      else
        super
      end
    end

  end
end
