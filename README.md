Simple Presenter
=================

A Presenter Pattern made easy for Ruby and Rails application.


## Usage

    class Person < Struct.new(:first_name, :last_name); end

    class PersonPresenter < SimplePresenter
      presents :person, attributes: [:first_name, :last_name]

      def full_name
        "#{person_first_name} #{person_last_name}"
      end
    end

    class App
      include SimplePresenter::Helpers
      
      def initialize
        person = Person.new("John", "Doe")
        presenter = present @person
        puts presenter.full_name
      end

    end
