require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'
require 'fileutils'

desc "Check mono is recent enough and correctly installed"
task :happy do
  print "Checking mono >= 2.2 installed - "
  version = `mono --version`.scan(/Mono JIT compiler version (\d+.\d+)/).to_s
  raise "FAILED! #{version}" unless version >= "2.2"
  puts "OK"
end

desc "Run ir via mono"
task :ir do
  system! "mono Release/ir.exe"
end

desc "Download the nightly IronRuby binaries"
task :download do
  url = latest_dlr_url
  zip = url.split('/').last
  
  system! "curl -O #{zip}" unless File.exists?(zip)
  system! "unzip #{zip}"
  
  puts "Patching ir.exe.config for signing issues"
  cp "ir.no-key.exe.config", "Release/ir.exe.config"
end

def latest_dlr_url
  source = "http://nightlybuilds.cloudapp.net/rss.ashx?project=dlr"
  rss = RSS::Parser.parse(open(source), false)
  rss.items.find { |e| e.link =~ /DLR\.\d+\.release\.zip/ }.link
end
  
def system!(cmd)
  raise "Failed: #{cmd}" unless system(cmd)
end

