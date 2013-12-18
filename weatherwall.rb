%w[APIFetcher AppleScriptWrapper OpenWeatherMapFetcher PropertyLoader TemplateMapper Utils].each do |file|
  require File.join(File.dirname(__FILE__), "lib", file)
end

module WeatherWall
  begin
    BASEPATH = File.join(File.dirname(__FILE__))  
    props = PropertyLoader.new( File.join(BASEPATH,"weather.properties") )

    params = props.getProperty(:lat),props.getProperty(:lon)
    fetcher = OpenWeatherMapFetcher.new(*params)
    iconfile =  fetcher.fetchCurrentStats().getProperty(:weather)["icon"]
    IMGBASEPATH = props.getProperty(:imagesdir)
    fpath = File.join(IMGBASEPATH,iconfile.split(".")[0]+".jpg")
    text = TemplateMapper.new(File.join(BASEPATH,"ascript.template")).templatereplace({"$$FPATH$$"=>fpath})
    AppleScriptWrapper.execute(text)
    
    STDERR.puts "Done executing script at "+Time.new.inspect
  rescue StandardError
    STDERR.puts "Script failed due to #{$!}"
  end
end
