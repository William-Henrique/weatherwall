%w[APIFetcher AppleScriptWrapper OpenWeatherMapFetcher PropertyLoader TemplateMapper Utils].each do |file|
  require File.join(File.dirname(__FILE__), "../lib", file)
end

require 'test/unit'
require 'tempfile'

class WeatherWallTests < Test::Unit::TestCase
  def test_utils
    u = WeatherWall::Utils
    
    tmphash = {"q" => "cheese", "agent" => "browser"}
    assert_equal("?q=cheese&agent=browser",u.hash_to_querystring(tmphash))
    
    jsonstr=%Q|{"say":"woof","class":"dog"}|
    assert_equal({"say"=>"woof","class"=>"dog"},u.jsonstr_to_hash(jsonstr))
  end
end