# Jsonable

```ruby
class Sample
  include Jsonable

  def initialize(name)
    @name = name
  end
end

sample = Sample.new("hoge")
puts sample.to_json
```
