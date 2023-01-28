class ApplicationController < ActionController::API
  before_action :to_snake_case!

  private
  def to_snake_case!
    params.deep_transform_keys!{|k| k.underscore}
  end
end
