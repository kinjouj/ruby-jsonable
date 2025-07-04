# frozen_string_literal: true

module Jsonable
  def to_hash
    excludes = exclude_jsonable || []
    instance_variables.map {|key|
      keystr = key.to_s.tr("@", "")
      next if excludes.include?(keystr)

      [ keystr, instance_variable_get(key) ]
    }.compact.to_h
  end

  def to_json(*)
    hash = to_hash
    hash[JSON.create_id] = self.class.name if enable_additions?
    hash.to_json
  end

  def exclude_jsonable
    []
  end

  def enable_additions?
    false
  end
end
