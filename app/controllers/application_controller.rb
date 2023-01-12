class ApplicationController < ActionController::API
  before_action :to_snake_case!

  private
  def to_snake_case!
    params.transform_keys!{|k| k.underscore}
  end
end
