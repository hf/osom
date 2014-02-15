require 'treetop'
require './osom-runtime.rb'

module Osom

  module Syntax
    module Statements
      def compile
        head = l = Runtime::Cons.new

        statements.elements.each do |statement_element|
          statement = statement_element.statement

          l.head = statement.compile
          l = l.rest = Runtime::Cons.new
        end

        head
      end
    end

    class Node < Treetop::Runtime::SyntaxNode

      def compile
      end

      def atom?
        false
      end
    end

    module Atom
      def atom?
        true
      end
    end

    class Number < Node
      include Atom

      def compile
        if fractional.empty?
          return text_value.to_i
        else
          return text_value.to_f
        end
      end
    end

    class Symbol < Node
      include Atom

      def compile
        return symbol.text_value.downcase.to_sym
      end
    end

    class List < Node
      def compile
        if contents.empty?
          return Runtime::Cons.new
        end

        head = l = Runtime::Cons.new contents.head.compile

        contents.rest.elements.each do |rest_element|
          l = l.rest = Runtime::Cons.new rest_element.element.compile
        end

        head
      end
    end
  end

end
