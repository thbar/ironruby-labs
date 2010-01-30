$LOAD_PATH << File.dirname(__FILE__) + '/gems/liquid-2.0.0/lib'
require 'liquid'

#puts "We're here running #{RUBY_PLATFORM}"

@template = Liquid::Template.parse("hi from RUBY_PLATFORM {{platform}}")
puts @template.render( 'platform' => RUBY_PLATFORM)
