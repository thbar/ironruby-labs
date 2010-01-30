$LOAD_PATH << File.dirname(__FILE__) + '/gems/liquid-2.0.0/lib'

require 'liquid'

# the require above throws:
# :0:in `require': Expression of type 'System.Boolean' cannot be used for parameter of type 'System.Object' of method 'System.Object DefineMethod(System.Object, IronRuby.Runtime.RubyScope, IronRuby.Runtime.Calls.RubyMethodBody)' (ArgumentError)
#        from ./gems/liquid-2.0.0/lib/liquid.rb:51
#        from hello.rb:2
#        from :0:in `require' 

@template = Liquid::Template.parse("hi from RUBY_PLATFORM {{platform}}")
puts @template.render( 'platform' => RUBY_PLATFORM)
