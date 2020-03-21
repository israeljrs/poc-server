# frozen_string_literal: true

module Api
  module V1
    # Class controller users
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show update destroy]

      def index
        users = User.order('created_at DESC')
        render json: { status: 'SUCCESS', data: users }, status: :ok
      end

      def create
        user = User.new(users_params)
        user.save!
        render json: { status: 'SUCCESS', data: user }, status: :ok
      end

      def show
        render json: { status: 'SUCCESS', data: @user }, status: :ok
      end

      def update
        @user.update(users_params)
        render json: { status: 'SUCCESS', data: @user }, status: :ok
      end

      def destroy
        @user.destroy!
        render json: { status: 'SUCCESS',
                       msg: 'Dados excluidos com sucesso !!!' }, status: :ok
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def users_params
        params.permit(:nome, :cpf, :email)
      end
    end
  end
end
