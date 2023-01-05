class CreateGroupAndUsers
  include BaseService

  def initialize params
    @group_params = params[:group]
    @users_params = params[:users]
    @group = nil
    @users = []
  end

  def call
    ActiveRecord::Base.transaction do
      @group = Group.create!(group_params)
      user_names = users_params.map{|user_param| user_param[:name]}
      user_names.map do |name|
        @users << group.users.create!(name: name)
      end

      data = {
        group: @group,
        users: @users
      }
      ServiceResult.new success: true, data: data
    end
  rescue StandardError => e
    puts e
    ServiceResult.new success: false, errors: [e]
  end

  private
  attr_reader :group, :users, :group_params, :users_params
end
