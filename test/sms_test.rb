# frozen_string_literal: true

require 'test_helper'

describe Tele2::SMS do
  subject { Tele2::SMS }

  let(:amount) { Random.rand 1..1000 }
  let(:sms) { subject.new amount }
  
  describe '.new' do
    it 'does not accept negative ammounts' do
      assert_raises(RangeError) { subject.new (-amount) }
    end
  end

  describe '#to_i' do
    it 'returns the integer amount' do
      assert_equal amount, sms.to_i
    end
  end

  describe '#to_f' do
    it 'returns the float amount' do
      assert_equal amount.to_f, sms.to_f
    end
  end

  describe '#to_s' do
    it 'returns the amount' do
      assert_equal "#{amount} st", sms.to_s
    end
  end

  describe '#coerce' do
    it 'coerces the number' do
      equivalent_something, equivalent_self = sms.coerce 100

      assert_kind_of subject, equivalent_something
      assert_kind_of subject, equivalent_self
      assert_equal 100, equivalent_something.to_i
      assert_same sms, equivalent_self
    end
  end

  describe '#<=>' do
    it 'compares two data amounts' do
      assert_equal (-1), (sms <=> (amount + 1))
      assert_equal 0, (sms <=> amount)
      assert_equal 1, (sms <=> (amount - 1))
    end
  end

  describe '#+' do
    it 'adds two amounts together' do
      assert_equal amount + 1, sms + 1
    end
  end

  describe '#-' do
    it 'subtracts two amounts' do
      assert_equal amount - 1, sms - 1
    end
  end

  describe '#*' do
    it 'multiplies with numerics' do
      assert_equal amount * 2, sms * 2
    end
  end

  describe '#/' do
    it 'divides by numerics' do
      assert_equal amount / 2, sms / 2
    end
  end
end
