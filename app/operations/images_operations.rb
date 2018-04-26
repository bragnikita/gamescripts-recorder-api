module ImagesOperations
  include Operations

  class Create < Operations::Base
    attr_accessor :content, :category

    def doWork
      @result = Image.create!(:link => content, :category => category)
    end

    def result
      @result
    end
  end
end