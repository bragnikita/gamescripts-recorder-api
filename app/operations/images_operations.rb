require 'operations_base'
module ImagesOperations
  include Operations

  class Select < Operations::Base
    attr_accessor :id

    def doWork
      return Image.find(id) if id.present?
      Image.all
    end
  end

  class Create < Operations::Base
    attr_accessor :content, :category, :user

    def doWork
      @result = Image.create!(:link => content, :category => category, :added_by => user)
    end

    def result
      @result
    end
  end

  class Delete < Operations::Base
    attr_accessor :id

    def doWork
      Image.destroy(id)
    end
  end

  class Edit < Operations::Base
    attr_accessor :id, :attributes

    def doWork
      o = Image.find(id)
      o.update!(attributes)
      o
    end
  end
end