# frozen_string_literal: true

module Jsonable
  def to_hash
    excludes = (exclude_jsonable || []).map(&:to_s)
    instance_variables.map {|key|
      keystr = key.to_s.tr("@", "")
      next if excludes.include?(keystr)

      [ keystr.to_sym, instance_variable_get(key) ]
    }.compact.to_h
  end

  def to_json(*)
    hash = to_h
    hash[JSON.create_id] = self.class.name if enable_additions?
    hash.to_json
  end

  def exclude_jsonable
    []
  end

  def enable_additions?
    false
  end

  alias_method :to_h, :to_hash
end
