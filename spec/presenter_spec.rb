require File.expand_path("../spec_helper", __FILE__)

include SimplePresenter::Helpers

describe SimplePresenter do
  
  before do
    @example = Example.new("Bryan")
  end

  it "must equal the name" do
    @presenter = present @example
    @presenter.whoami.must_equal "Bryan"
  end

  it "must equal the greeting message" do
    @presenter = present @example
    @presenter.message.must_equal "Hello! My name is Bryan."
  end

  it "must equal the name with block" do
    present @example do |presenter|
      presenter.whoami.must_equal "Bryan"
    end
  end
  it "must equal the message with block" do
    present @example do |presenter|
      presenter.message.must_equal "Hello! My name is Bryan."
    end
  end
end
