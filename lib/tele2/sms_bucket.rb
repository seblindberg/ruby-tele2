# frozen_string_literal: true

module Tele2
  class SMSBucket < Bucket
    def self.match(json)
      json['bucketType'] == 0 && json['description'] == 'SMS'
    end
  end
end
