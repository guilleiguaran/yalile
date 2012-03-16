class AvoidDestroy

  def self.before_destroy(record)
    record_name = record.class.name
    record.errors.add(record_name.downcase.to_sym, "The record #{record_name} is not allowed to be deleted.")
    return false
  end

end
