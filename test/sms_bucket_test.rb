# frozen_string_literal: true

require 'test_helper'

describe Tele2::SMSBucket do
  subject { Tele2::SMSBucket }

  describe '.match' do
    it 'matches sms buckets' do
      assert subject.match TestHelper.example_sms_bucket
    end

    it 'does not match non sms buckets' do
      refute subject.match TestHelper.example_data_bucket
      refute subject.match TestHelper.example_mms_bucket
    end
  end
end