module UsersOperations
  private

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

  public

  class Select < Base
    attr_accessor :id

    def doWork
      if id
        @result = User.find(id)
      else
        @result = User.all
      end
    end

    def result
      @result
    end
  end

  class Create < Base
    attr_accessor :attributes

    def doWork
      @user = User.create!(attributes)
    end

    def result
      @user
    end

  end

  class Update < Base
    attr_accessor :id, :attributes

    def doWork
      @user = User.find(id)
      @user.update_attributes!(attributes)
    end

    def result
      @user
    end
  end

  class Delete < Base
    attr_accessor :id

    def doWork
      User.find(id).update!(:is_active => false)
    end
  end


end