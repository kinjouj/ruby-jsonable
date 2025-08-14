# frozen_string_literal: true

require "jsonable"

class Sample
  include Jsonable

  def initialize
    @name = "sample"
    @age  = 30
    @ext  = "test"
  end

  def exclude_jsonable
    [:name, "ext"]
  end

  def enable_additions?
    true
  end
end

describe Jsonable do
  it "successful" do
    sample = Sample.new
    expect(sample.exclude_jsonable).to eq([:name, "ext"])
    expect(sample).to be_enable_additions
    expect(sample.to_hash).to eq({ age: 30 })
    json = sample.to_json
    expect(json).to eq({ age: 30, JSON.create_id => sample.class.name }.to_json)
  end

  it "module default test" do
    obj = Object.new.extend(described_class)
    expect(obj).not_to be_enable_additions
    expect(obj.exclude_jsonable).to eq([])
    expect(obj.to_json).to eq("{}")
    expect(obj.to_hash).to eq({})
  end
end
