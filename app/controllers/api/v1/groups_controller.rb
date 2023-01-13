module Api
  module V1
    class GroupsController < ApplicationController
      def create
        result = CreateGroupAndUsers.call group_and_users_params
        group = result.data[:group]

        if result.success?
          render json: {
            success: true,
            group: {
              id: group.id,
              name: group.name,
              description: group.description
            },
            users: result.data[:users].to_json(only: [:name])
          }, status: :ok
        else
          render json: {
            success: false,
            errors: result.errors.first.message
          }, status: :internal_server_error
        end
      end

      def show
        group = Group.find_by!(id: params[:id])
        users = group.users

        render json: {
          group: {
            name: group.name,
            description: group.description
          },
          users: users
        }, status: :ok
      end

      private

      def group_and_users_params
        params.permit(
          group: [
            :name,
            :description
          ],
          users: [
            :name
          ]
        )
      end
    end
  end
end