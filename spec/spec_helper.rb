$:.unshift "lib"

require "simple_presenter"
require "minitest/autorun"

class Example < Struct.new(:name)

  def greeting
    "Hello! My name is #{name}."
  end

end

class ExamplePresenter < SimplePresenter
  presents :example, attributes: [:name]

  def whoami
    example_name
  end

  def message
    example.greeting
  end

end
