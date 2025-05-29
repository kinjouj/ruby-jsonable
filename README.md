# Jsonable

```ruby
class Sample
  include Jsonable

  def initialize
    @name = name
  end
end

sample = Sample.new
puts sample.to_json
```
