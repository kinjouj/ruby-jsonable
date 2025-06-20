# frozen_string_literal: true

require "jsonable"

class Sample
  include Jsonable

  def initialize
    @name = "sample"
    @age  = 30
  end

  def exclude_jsonable
    [ "name" ]
  end
end

describe Jsonable do
  it "test" do
    sample = Sample.new
    json   = sample.to_json
    expect(json).not_to be_nil
    expect(json).to eq({ age: 30 }.to_json)
  end
end
