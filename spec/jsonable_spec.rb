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

  def enable_additions?
    true
  end
end

describe Jsonable do
  it "test" do
    sample = Sample.new
    expect(sample.exclude_jsonable).to eq(["name"])
    expect(sample.enable_additions?).to be_truthy
    json = sample.to_json
    expect(json).to eq({ age: 30, JSON.create_id => sample.class.name }.to_json)
  end
end
