# frozen_string_literal: true

module Tele2
  class SMS < Numeric
    def initialize(amount)
      raise RangeError, 'SMS count can not be negative' if amount < 0
      @amount = amount.to_i
    end

    def to_s
      format '%i st', @amount
    end

    def to_i
      @amount.to_i
    end

    def to_f
      @amount.to_f
    end

    def coerce(other)
      [self.class.new(other.to_i), self]
    end

    def <=>(other)
      @amount <=> other.to_i
    end

    def +(other)
      self.class.new @amount + other.to_i
    end

    def -(other)
      self.class.new @amount - other.to_i
    end

    def *(other)
      self.class.new @amount * other.to_i
    end

    def /(other)
      self.class.new @amount / other.to_i
    end
  end
end
