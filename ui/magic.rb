require 'control'

# a better attempt at Windows::Forms dsl
class Magic
  class << self
    def build(&description)
      self.new.instance_eval(&description)
    end
  end

  def classify(string)
    string.gsub(/(^|_)(.)/) { $2.upcase } # simplified version of Rails inflector
  end
    
  def method_missing(method,*args)
    @stack ||= []
    clazz = eval(classify(method.to_s))
    control = clazz.build(*args)
    @stack.last << control if @stack.last
    @stack.push(control)
    yield if block_given?
    @stack.pop
  end
  
end
