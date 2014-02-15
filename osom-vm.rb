require 'treetop'
require './osom.rb'
require './osom-runtime.rb'

module Osom
  def self.load debug = true
    if debug
      Treetop.load "osom"
    else
      require './osom-parser.rb'
    end
  end

  class VM
    def initialize debug = false
      @scope  = Runtime::Scope.new
      @parser = OsomParser.new
    end

    def execute compiled
      l = compiled

      until l.nil?
        @scope.eval l.head
        l = l.rest
      end
    end

    def compile code
      parsed = @parser.parse code
      parsed.compile
    end
  end
end
