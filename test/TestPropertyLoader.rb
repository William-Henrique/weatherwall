%w[APIFetcher AppleScriptWrapper OpenWeatherMapFetcher PropertyLoader TemplateMapper Utils].each do |file|
  require File.join(File.dirname(__FILE__), "../lib", file)
end

require 'test/unit'
require 'tempfile'


class WeatherWallTests < Test::Unit::TestCase
  def test_propertyloader
    @tfile = Tempfile.new("tempfilePLoader")
    @tfile.puts("lat::23\nlon::25\nimagesdir::/Users/abhilash\napiurl::http://test.com\n")
    @tfile.close
    p = WeatherWall::PropertyLoader.new(@tfile.path)
    assert_equal("23",p.getProperty(:lat).to_s)
    assert_equal("25",p.getProperty(:lon).to_s)
    assert_equal("/Users/abhilash",p.getProperty(:imagesdir).to_s)
    assert_equal("http://test.com",p.getProperty(:apiurl).to_s)
  end
end