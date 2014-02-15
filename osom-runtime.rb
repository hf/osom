module Runtime
    class Cons
      attr_accessor :head
      attr_accessor :rest

      def initialize head = nil, rest = nil
        @head = head
        @rest = rest
      end

      def to_a
        array = []

        l = self
        until l.nil? do
          array.push l.head
          l = l.rest
        end

        array
      end

      def inspect
        to_a.inspect
      end

      def nil?
        @head.nil? and @rest.nil?
      end

      def to_s
        if nil?
          return "nil"
        end

        "(cons #{@head} #{@rest})"
      end
    end

    class Scope
      def initialize
        @meta = class << self; self; end
      end

      def define_method name, &block
        @meta.send(:define_method, name, block)
      end

      def nil
        nil
      end

      def cons l
        Cons.new l.head, l.rest
      end

      def debugprint l
        until l.nil? do
          puts l.head
          l = l.rest
        end
      end

      def eval l
        if not l.is_a? Cons or l.nil?
          return l
        end

        if not l.head.is_a? Symbol
          raise RuntimeError.new "'#{l.head}' is not a function name."
        end

        if l.head == :quote
          return l.rest
        end

        i = l.rest
        arguments = rest = Cons.new

        until i.nil? do
          rest.head = self.send(:eval, i.head)
          rest = rest.rest = Cons.new
          i = i.rest
        end

        self.send(l.head, arguments)
      end
    end
  end
