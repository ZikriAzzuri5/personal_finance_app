class ServiceBase
  attr_reader :result

  def initialize
    @result = Struct.new(
      :value,
      :errors,
      :status,
      keyword_init: true
    ).new
  end

  class << self
    def call(*args)
      self.new.call(*args)
    end
  end
end

