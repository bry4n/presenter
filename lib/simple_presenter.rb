require 'simple_presenter/core_ext/string' unless defined?(ActiveSupport::Inflector)

class SimplePresenter

  module Helpers

    def present(object, klass = nil)
      klass ||= "#{object.class}Presenter".constantize
      presenter = klass.new(object, self)
      yield presenter if block_given?
      presenter
    end

  end

  def initialize(object, template)
    @object     = object
    @template   = template
  end

  private

  def self.presents(name, options = {})
    
    attributes = options[:attributes] || []

    define_method(name) do
      @object
    end
    
    if attributes.is_a?(Array)
      options[:attributes].each do |attr|
        define_method("#{name}_#{attr}") do
          @object.send(attr)
        end
      end
    end

  end

  def content
    @template
  end

  def method_missing(*args, &blk)
    @template.send(*args, &blk)
  end

end

