require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'tele2'

require 'minitest/autorun'
require 'date'

module TestHelper
  module_function
  
  def example_data_bucket
    total = Random.rand(1024.0..3096.0).round
    used = Random.rand(0.0..100.0).round(1)
    to_be_restored = Date.today + Random.rand(1..30)
    
    {
      "usedPercentage"=>used,
      "leftToUsePercentage"=>100 - used,
      "used"=>"0,32 GB",
      "leftToUse"=>"0,68 GB",
      "description"=>"Example label",
      "bucketType"=>4,
      "unitString"=>"",
      "toBeRestoredString"=>to_be_restored.to_s,
      "total"=>total,
      "showPercentage"=>true
    }
  end
  
  def example_sms_bucket
    total = Random.rand(1000.0..3000.0).round
    used = Random.rand(0.0..100.0).round(1)
    to_be_restored = Date.today + Random.rand(1..30)

    {
      "usedPercentage"=>used,
      "leftToUsePercentage"=>100 - used,
      "used"=>(used / 100 * total).round.to_s,
      "leftToUse"=>((1 - used / 100) * total).round.to_s,
      "description"=>"SMS",
      "bucketType"=>0,
      "unitString"=>" st",
      "toBeRestoredString"=>to_be_restored.to_s,
      "total"=>total,
      "showPercentage"=>true
    }
  end
  
  def example_mms_bucket
    total = Random.rand(1000.0..3000.0).round
    used = Random.rand(0.0..100.0).round(1)
    to_be_restored = Date.today + Random.rand(1..30)
    
    {
      "usedPercentage"=>used,
      "leftToUsePercentage"=>100 - used,
      "used"=>(used / 100 * total).round.to_s,
      "leftToUse"=>((1 - used / 100) * total).round.to_s,
      "description"=>"MMS",
      "bucketType"=>0,
      "unitString"=>" st",
      "toBeRestoredString"=>to_be_restored.to_s,
      "total"=>total,
      "showPercentage"=>true
    }
  end
  
  def example_unknown_bucket
    total = Random.rand(1000.0..3000.0).round
    used = Random.rand(0.0..100.0).round(1)
    to_be_restored = Date.today + Random.rand(1..30)

    {
      "usedPercentage"=>used,
      "leftToUsePercentage"=>100 - used,
      "used"=>(used / 100 * total).round.to_s,
      "leftToUse"=>((1 - used / 100) * total).round.to_s,
      "description"=>"unknown",
      "bucketType"=>0,
      "unitString"=>" st",
      "toBeRestoredString"=>to_be_restored.to_s,
      "total"=>total,
      "showPercentage"=>true
    }
  end
  
  def example_json
    JSON.generate 'listOfBuckets' => [
      example_data_bucket,
      example_sms_bucket,
      example_mms_bucket,
      example_unknown_bucket
    ]
  end
end
