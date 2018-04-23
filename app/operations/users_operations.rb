module UsersOperations
  private

  class Base
    def call
      doWork
      self
    end


    protected

    def doWork

    end
  end

  public

  class Select < Base

    def doWork
      self
    end

    def result
      User.all
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


end