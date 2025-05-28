# frozen_string_literal: true

require "json"

module Jsonable
  def to_json(*)
    hash = self.instance_variables.map {|key|
      [ key.to_s.tr("@", ""), self.instance_variable_get(key)]
    }.to_h
    hash.to_json
  end
end
