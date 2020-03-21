# frozen_string_literal: true

module Api
  module V1
    # Class controller orders
    class OrdersController < ApplicationController
      before_action :set_order, only: %i[show update destroy]

      def index
        orders = Order.order('created_at DESC')
        render json: { status: 'SUCCESS', data: orders }, status: :ok
      end

      def create
        order = Order.new(orders_params)
        order.save!
        render json: { status: 'SUCCESS', data: order }, status: :ok
      end

      def show
        render json: { status: 'SUCCESS', data: @order }, status: :ok
      end

      def update
        @order.update(orders_params)
        render json: { status: 'SUCCESS', data: @order }, status: :ok
      end

      def destroy
        @order.destroy!
        render json: { status: 'SUCCESS',
                       msg: 'Dados excluidos com sucesso !!!' }, status: :ok
      end

      private

      def set_order
        @order = Order.find(params[:id])
      end

      def orders_params
        params.permit(:user_id, :model, :vrl_year, :num_parcel)
      end
    end
  end
end
