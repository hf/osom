# Autogenerated from a Treetop grammar. Edits may be lost.


require './osom.rb'

module Osom
  include Treetop::Runtime

  def root
    @root ||= :statements
  end

  module Statements0
    def statement
      elements[1]
    end

  end

  module Statements1
    def statements
      elements[0]
    end
  end

  def _nt_statements
    start_index = index
    if node_cache[:statements].has_key?(index)
      cached = node_cache[:statements][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    s1, i1 = [], index
    loop do
      i2, s2 = index, []
      s3, i3 = [], index
      loop do
        r4 = _nt_ws
        if r4
          s3 << r4
        else
          break
        end
      end
      r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
      s2 << r3
      if r3
        r5 = _nt_list
        s2 << r5
        if r5
          s6, i6 = [], index
          loop do
            r7 = _nt_ws
            if r7
              s6 << r7
            else
              break
            end
          end
          r6 = instantiate_node(SyntaxNode,input, i6...index, s6)
          s2 << r6
        end
      end
      if s2.last
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
        r2.extend(Statements0)
      else
        @index = i2
        r2 = nil
      end
      if r2
        s1 << r2
      else
        break
      end
    end
    r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
    s0 << r1
    if s0.last
      r0 = instantiate_node(Osom::Syntax::Statements,input, i0...index, s0)
      r0.extend(Statements1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:statements][start_index] = r0

    r0
  end

  module List0
    def element
      elements[1]
    end
  end

  module List1
    def head
      elements[0]
    end

    def rest
      elements[1]
    end
  end

  module List2
    def contents
      elements[2]
    end

  end

  def _nt_list
    start_index = index
    if node_cache[:list].has_key?(index)
      cached = node_cache[:list][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('(', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('(')
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        r3 = _nt_ws
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
      if r2
        i5, s5 = index, []
        i6 = index
        r7 = _nt_list
        if r7
          r6 = r7
        else
          r8 = _nt_number
          if r8
            r6 = r8
          else
            r9 = _nt_symbol
            if r9
              r6 = r9
            else
              @index = i6
              r6 = nil
            end
          end
        end
        s5 << r6
        if r6
          s10, i10 = [], index
          loop do
            i11, s11 = index, []
            s12, i12 = [], index
            loop do
              r13 = _nt_ws
              if r13
                s12 << r13
              else
                break
              end
            end
            if s12.empty?
              @index = i12
              r12 = nil
            else
              r12 = instantiate_node(SyntaxNode,input, i12...index, s12)
            end
            s11 << r12
            if r12
              i14 = index
              r15 = _nt_list
              if r15
                r14 = r15
              else
                r16 = _nt_number
                if r16
                  r14 = r16
                else
                  r17 = _nt_symbol
                  if r17
                    r14 = r17
                  else
                    @index = i14
                    r14 = nil
                  end
                end
              end
              s11 << r14
            end
            if s11.last
              r11 = instantiate_node(SyntaxNode,input, i11...index, s11)
              r11.extend(List0)
            else
              @index = i11
              r11 = nil
            end
            if r11
              s10 << r11
            else
              break
            end
          end
          r10 = instantiate_node(SyntaxNode,input, i10...index, s10)
          s5 << r10
        end
        if s5.last
          r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
          r5.extend(List1)
        else
          @index = i5
          r5 = nil
        end
        if r5
          r4 = r5
        else
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r4
        if r4
          s18, i18 = [], index
          loop do
            r19 = _nt_ws
            if r19
              s18 << r19
            else
              break
            end
          end
          r18 = instantiate_node(SyntaxNode,input, i18...index, s18)
          s0 << r18
          if r18
            if has_terminal?(')', false, index)
              r20 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure(')')
              r20 = nil
            end
            s0 << r20
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(Osom::Syntax::List,input, i0...index, s0)
      r0.extend(List2)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:list][start_index] = r0

    r0
  end

  module Symbol0
    def symbol
      elements[0]
    end
  end

  def _nt_symbol
    start_index = index
    if node_cache[:symbol].has_key?(index)
      cached = node_cache[:symbol][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    s1, i1 = [], index
    loop do
      if has_terminal?('\G[a-zA-Z]', true, index)
        r2 = true
        @index += 1
      else
        r2 = nil
      end
      if r2
        s1 << r2
      else
        break
      end
    end
    if s1.empty?
      @index = i1
      r1 = nil
    else
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
    end
    s0 << r1
    if s0.last
      r0 = instantiate_node(Osom::Syntax::Symbol,input, i0...index, s0)
      r0.extend(Symbol0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:symbol][start_index] = r0

    r0
  end

  module Number0
    def sign
      elements[0]
    end

    def integral
      elements[1]
    end

    def fractional
      elements[2]
    end
  end

  def _nt_number
    start_index = index
    if node_cache[:number].has_key?(index)
      cached = node_cache[:number][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r2 = _nt_sign
    if r2
      r1 = r2
    else
      r1 = instantiate_node(SyntaxNode,input, index...index)
    end
    s0 << r1
    if r1
      r3 = _nt_integral
      s0 << r3
      if r3
        r5 = _nt_fractional
        if r5
          r4 = r5
        else
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r4
      end
    end
    if s0.last
      r0 = instantiate_node(Osom::Syntax::Number,input, i0...index, s0)
      r0.extend(Number0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:number][start_index] = r0

    r0
  end

  module Integral0
  end

  def _nt_integral
    start_index = index
    if node_cache[:integral].has_key?(index)
      cached = node_cache[:integral][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('\G[1-9]', true, index)
      r1 = true
      @index += 1
    else
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        if has_terminal?('\G[0-9]', true, index)
          r3 = true
          @index += 1
        else
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Integral0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:integral][start_index] = r0

    r0
  end

  module Fractional0
  end

  def _nt_fractional
    start_index = index
    if node_cache[:fractional].has_key?(index)
      cached = node_cache[:fractional][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('.', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('.')
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        if has_terminal?('\G[0-9]', true, index)
          r3 = true
          @index += 1
        else
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      if s2.empty?
        @index = i2
        r2 = nil
      else
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      end
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Fractional0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:fractional][start_index] = r0

    r0
  end

  def _nt_sign
    start_index = index
    if node_cache[:sign].has_key?(index)
      cached = node_cache[:sign][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    if has_terminal?('-', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('-')
      r1 = nil
    end
    if r1
      r0 = r1
    else
      if has_terminal?('+', false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('+')
        r2 = nil
      end
      if r2
        r0 = r2
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:sign][start_index] = r0

    r0
  end

  def _nt_ws
    start_index = index
    if node_cache[:ws].has_key?(index)
      cached = node_cache[:ws][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?('\G[ \\t\\n\\r]', true, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      r0 = nil
    end

    node_cache[:ws][start_index] = r0

    r0
  end

end

class OsomParser < Treetop::Runtime::CompiledParser
  include Osom
end
