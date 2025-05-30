# frozen_string_literal: true

module Jsonable
  def to_hash
    excludes = exclude_jsonable || []
    hash = self.instance_variables.map {|key|
      keystr = key.to_s.tr("@", "")
      next if excludes.include?(keystr)
      [ keystr, self.instance_variable_get(key)]
    }.compact.to_h
  end

  def to_json(*)
    to_hash.to_json
  end

  def exclude_jsonable
    []
  end
end
