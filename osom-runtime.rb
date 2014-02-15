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
        @scope = {
          :nil => nil
        }

        define_function :cons, lambda { |l, scope|
          return Cons.new l.head, l.rest
        }

        define_function :debugprint, lambda { |l, scope|
          until l.nil? do
            puts l.head
            l = l.rest
          end
        }

        define_function :eval, lambda { |l, scope|
          if l.is_a? Symbol
            if scope.has_key? l
              return scope[l]
            end

            raise RuntimeError.new "Undefined variable #{l}."
          end

          if not l.is_a? Cons or l.nil?
            return l
          end

          if not l.head.is_a? Symbol
            raise RuntimeError.new "'#{l.head}' is not a function name."
          end

          if l.head == :quote
            return l.rest.head
          end

          if not scope.has_key? l.head or not scope[l.head].is_a? Proc
            raise RuntimeError.new "'#{l.head}' is not a defined function."
          end

          i = l.rest
          arguments = rest = Cons.new

          until i.nil? do
            rest.head = scope[:eval].call(i.head, scope)
            rest = rest.rest = Cons.new
            i = i.rest
          end

          scope[l.head].call(arguments, scope)
        }

        define_function :set, lambda { |l, scope|
          if not l.rest.is_a? Cons
            raise RuntimeError.new "Two arguments are required for (set)."
          end

          if not l.head.is_a? Symbol
            raise RuntimeError.new "'#{l.head}' not a symbol. Cannot set anything else but a symbol."
          end

          scope[l.head] = l.rest.head
        }
      end

      def define_function name, block
        @scope[name] = block
      end

      def [](name)
        @scope[name]
      end

      def []=(name, value)
        @scope[name] = value
      end

      def has_key?(name)
        @scope.has_key? name
      end

      def eval l
        @scope[:eval].call(l, self)
      end
    end
  end
