require "jsonable"

class Sample
  include Jsonable

  def initialize
    @name = "sample"
  end
end

describe Jsonable do
  it "test" do
    sample = Sample.new
    expect(sample.to_json).not_to be_nil
    expect(sample.to_json).to eq({ name: "sample" }.to_json)
  end
end
