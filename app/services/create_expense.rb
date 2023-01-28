class CreateExpense
  include BaseService

  def initialize params
    @group_id = params[:group_id]
    @payer_params = params[:payer]
    @payee_ids = params[:payee_ids]
  end

  def call
    ActiveRecord::Base.transaction do
      group = Group.find_by_id group_id
      # WIP...
      ServiceResult.new success: true, data: 'data'
    end
  rescue StandardError => e
    puts e
    ServiceResult.new success: false, errors: [e]
  end

  private
  attr_reader :group_id, :payer_params, :payee_ids
end