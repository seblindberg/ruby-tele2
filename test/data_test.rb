# frozen_string_literal: true

require 'test_helper'

describe Tele2::Data do
  subject { Tele2::Data }
  
  let(:small_amount) { Random.rand 1...1024 }
  let(:large_amount) { Random.rand 1024..2048 }
  let(:small_data) { subject.new small_amount }
  let(:large_data) { subject.new large_amount }
  
  describe '#to_i' do
    it 'returns the integer amount' do
      assert_equal small_amount, small_data.to_i
    end
  end
  
  describe '#to_f' do
    it 'returns the float amount' do
      assert_equal small_amount.to_f, small_data.to_f
    end
  end
  
  describe '#to_s' do
    it 'returns the amount in MB when under a GB' do
      assert_equal "#{small_amount} MB", small_data.to_s
    end
    
    it 'returns the amount in GB when over a GB' do
      assert_equal format('%.1f GB', large_amount / 1024.0), large_data.to_s
    end
  end
  
  describe '#coerce' do
    it 'coerces the number' do
      equivalent_something, equivalent_self = small_data.coerce 100
      
      assert_kind_of subject, equivalent_something
      assert_kind_of subject, equivalent_self
      assert_equal 100, equivalent_something.to_i
      assert_same small_data, equivalent_self
    end
  end
  
  describe '#<=>' do
    it 'compares two data amounts' do
      assert_equal (-1), (small_data <=> large_data)
      assert_equal 0, (small_data <=> small_data)
      assert_equal 1, (large_data <=> small_data)
    end
  end
  
  describe '#+' do
    it 'adds two amounts together' do
      total_amount = large_amount + small_amount
      total_data = large_data + small_data
      
      assert_equal total_amount, total_data.to_i
    end
    
    it 'accepts other numerics' do
      total_amount = small_amount + 100
      total_data = small_data + 100
      
      assert_equal total_amount, total_data.to_i
    end
  end
  
  describe '#-' do
    it 'subtracts two amounts' do
      differing_amount = large_amount - small_amount
      differing_data = large_data - small_data

      assert_equal differing_amount, differing_data.to_i
    end
    
    it 'accepts other numerics' do
      differing_amount = large_amount - 100
      differing_data = large_data - 100
      
      assert_equal differing_amount, differing_data.to_i
    end
  end
  
  describe '#*' do
    it 'multiplies with numerics' do
      amount = large_amount * 2
      data = large_data * 2
      
      assert_equal amount, data.to_i
    end
  end
  
  describe '#/' do
    it 'divides by numerics' do
      amount = large_amount / 2
      data = large_data / 2

      assert_equal amount, data.to_i
    end
  end
end
