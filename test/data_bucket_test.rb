# frozen_string_literal: true

require 'test_helper'

describe Tele2::DataBucket do
  subject { Tele2::DataBucket }
  
  let(:example_data) { TestHelper.example_data_bucket }
  let(:bucket) { subject.new example_data }
  
  describe '.match' do
    it 'matches data buckets' do
      assert subject.match TestHelper.example_data_bucket
    end
    
    it 'does not match non data buckets' do
      refute subject.match TestHelper.example_sms_bucket
      refute subject.match TestHelper.example_mms_bucket
    end
  end
  
  describe '#label' do
    it 'returns the description' do
      assert_equal example_data['description'], bucket.label
    end
  end
  
  describe '#total' do
    it 'returns the total data' do
      assert_in_epsilon example_data['total'], bucket.total, 0.01
    end
  end
  
  describe '#used' do
    it 'returns the used amount' do
      used = example_data['usedPercentage'] / 100 * example_data['total']
      assert_in_epsilon used, bucket.used, 0.01
    end
  end
end