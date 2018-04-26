module Operations
  class Base
    def call
      doWork
      self
    end

    def result
      nil
    end


    protected

    def doWork

    end
  end
end