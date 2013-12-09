module WeatherWall
  class AppleScriptWrapper
    require 'tempfile'
    
    def self.execute(text)
      %x*osascript #{self.createTemp(text)}*
    end
    private
    def self.createTemp(text)
      t = Tempfile.new("aswrapper"+rand(10000).to_s)
      t.puts(text)
      t.close
      t.path
    end
  end
end