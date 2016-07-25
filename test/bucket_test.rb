# frozen_string_literal: true

require 'test_helper'

describe Tele2::Bucket do
  subject { Tele2::Bucket }

  let(:example_data) { TestHelper.example_sms_bucket }
  let(:bucket) { subject.new example_data }
  
  describe '.to_json' do
    it 'parses a JSON object' do
      buckets = subject.from_json TestHelper.example_json
      
      assert_kind_of Tele2::DataBucket, buckets[0]
      assert_kind_of Tele2::SMSBucket, buckets[1]
      assert_kind_of Tele2::MMSBucket, buckets[2]
      assert_kind_of Tele2::Bucket, buckets[3]
    end
  end

  describe '#total' do
    it 'returns the total data' do
      assert_equal example_data['total'].to_i, bucket.total
    end
  end

  describe '#used' do
    it 'returns the used amount' do
      assert_in_epsilon example_data['used'].to_f, bucket.used, 0.01
    end
  end

  describe '#remaining' do
    it 'returns the remaining amount' do
      assert_in_epsilon example_data['leftToUse'].to_f, bucket.remaining, 0.01
    end
  end
  
  describe '#label' do
    it 'returns the description' do
      assert_equal example_data['description'], bucket.label
    end
  end
end