# frozen_string_literal: true

module Tele2
  class Data < Numeric
    GB = 2**10
    TB = 2**20
  
    def initialize(mb)
      @amount = mb.to_f
    end
  
    def to_s
      if @amount >= GB
        format '%.1f GB', @amount / GB
      else
        format '%.0f MB', @amount
      end
    end
  
    def to_i
      @amount.to_i
    end
  
    def to_f
      @amount
    end
  
    def coerce(other)
      [self.class.new(other.to_f), self]
    end
  
    def <=>(other)
      @amount <=> other.to_f
    end
  
    def +(other)
      self.class.new @amount + other.to_f
    end
  
    def -(other)
      self.class.new @amount - other.to_f
    end
  
    def *(other)
      self.class.new @amount * other.to_f
    end
  
    def /(other)
      self.class.new @amount / other.to_f
    end
  end
end
