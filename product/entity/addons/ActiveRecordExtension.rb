module  ActiveRecordExtension
  def to_hash
    hash = {}
    instance_variables.each {|var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
    hash
  end

  def to_s
  	return self.to_hash
  end
end