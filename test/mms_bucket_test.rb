# frozen_string_literal: true

require 'test_helper'

describe Tele2::MMSBucket do
  subject { Tele2::MMSBucket }

  describe '.match' do
    it 'matches mms buckets' do
      assert subject.match TestHelper.example_mms_bucket
    end

    it 'does not match non mms buckets' do
      refute subject.match TestHelper.example_data_bucket
      refute subject.match TestHelper.example_sms_bucket
    end
  end
end