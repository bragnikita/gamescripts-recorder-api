module ErrorHandleable
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :render_validation_error
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  end

  private

  def render_validation_error(e)
    render status: :unprocessable_entity, json: {
        message: 'Validation error',
        errors: e.record.errors.messages
    }
  end

  def render_not_found(e)
    render status: :not_found
  end
end