# frozen_string_literal: true

module Tele2
  class MMSBucket < Bucket
    def self.match(json)
      json['bucketType'] == 0 && json['description'] == 'MMS'
    end
  end
end
