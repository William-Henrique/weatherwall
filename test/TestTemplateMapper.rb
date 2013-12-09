%w[APIFetcher AppleScriptWrapper OpenWeatherMapFetcher PropertyLoader TemplateMapper Utils].each do |file|
  require File.join(File.dirname(__FILE__), "../lib", file)
end

require 'test/unit'
require 'tempfile'

class WeatherWallTests < Test::Unit::TestCase
  def test_templatemapper
    @tfile = Tempfile.new("tempfilePLoader")
    @tfile.puts("file at $$FPATH$$ says $$MSG$$")
    @tfile.close
    t = WeatherWall::TemplateMapper.new(@tfile.path)
    replacedtext = t.templatereplace({"$$FPATH$$" => "/Users/abhilash/test.png", "$$MSG$$" => "foo"})
    assert_equal("file at /Users/abhilash/test.png says foo\n",replacedtext)
  end
end