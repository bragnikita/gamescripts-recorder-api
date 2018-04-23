module ErrorHandleable
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :render_validation_error
  end

  private

  def render_validation_error(e)
    render status: :unprocessable_entity, json: {
        message: 'Validation error',
        errors: e.record.errors.messages
    }
  end
end