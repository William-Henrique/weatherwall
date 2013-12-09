%w[TestPropertyLoader TestTemplateMapper TestUtils].each do |file|
  require File.join(File.dirname(__FILE__), file)
end

class WeatherWallTests < Test::Unit::TestCase
end