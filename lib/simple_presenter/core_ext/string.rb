class String
  def constantize
    constant = Object
    constant.const_defined?(self.to_s) ? constant.const_get(self.to_s) : constant.const_missing(self.to_s)
  end
end
