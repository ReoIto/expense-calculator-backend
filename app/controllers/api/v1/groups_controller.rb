module Api
  module V1
    class GroupsController < ApplicationController
      def index
        groups = Group.all

        render json: {
          groups: groups.as_json(only: [
            :id,
            :name,
            :descrioption
          ]), status: :ok
        }
      end

      def create
        result = CreateGroupAndUsers.call group_and_users_params
        if result.success?
          render json: {
            success: true,
            group: result.data[:group].to_json(only: [
              :id,
              :name,
              :description
            ]),
            users: result.data[:users].to_json(only: [:name])
          }, status: :ok
        else
          render json: {
            success: false,
            errors: result.errors.first.message
          }, status: :internal_server_error
        end
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