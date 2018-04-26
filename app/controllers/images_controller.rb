class ImagesController < ApplicationController
  include ErrorHandleable
  include ImagesOperations

  def create
    params = create_image_params
    op = operations :create
    op.content = params[:content]
    op.category = params[:category]
    op.call
    render status: :created, json: {
        object: {
            id: op.result.id,
            url: op.result.link.url
        }
    }
  end

  private

  def operations(name)
    case name
      when :create
        Create.new
      else
        raise "#{name} is not implemented yet"
    end
  end

  def create_image_params
    params.require(:image).permit(:content, :category)
  end

end