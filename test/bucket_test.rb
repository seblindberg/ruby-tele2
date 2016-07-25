# frozen_string_literal: true

require 'test_helper'

describe Tele2::Bucket do
  subject { Tele2::Bucket }

  let(:example_data) { TestHelper.example_sms_bucket }
  let(:bucket) { subject.new example_data }

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