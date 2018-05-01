class ImagesController < ApplicationController
  include ErrorHandleable
  include ImagesOperations

  def index
    op = operations :select
    op.call
    render :status => :ok, json: {
        collection: op.result.map {|i| serialize_image(i)}
    }
  end

  def show
    op = operations :select
    op.id = params[:id]
    op.call
    render :status => :ok, json: {
        object: serialize_image(op.result)
    }
  end

  def create
    params = create_image_params
    op = operations :create
    op.content = params[:content]
    op.category = params[:category]
    op.user = current_user
    op.call
    render status: :created, json: {
        object: {
            id: op.result.id,
            url: op.result.link.url
        }
    }
  end

  def destroy
    op = operations :delete
    op.id = params[:id]
    op.call
    render status: :no_content
  end

  def update
    op = operations :update
    op.id = params[:id]
    op.attributes = update_image_params
    op.call
    render status: :ok, json: {
        object: serialize_image(op.result)
    }
  end

  private

  def operations(name)
    case name
      when :select
        Select.new
      when :create
        Create.new
      when :delete
        Delete.new
      when :update
        Edit.new
      else
        raise "#{name} is not implemented yet"
    end
  end

  def create_image_params
    params.require(:image).permit(:content, :category)
  end

  def update_image_params
    params.require(:image).permit(:content, :category)
  end

  def serialize_image(image)
    {
        id: image.id,
        url: image.link.url,
        category: image.category
    }
  end

end