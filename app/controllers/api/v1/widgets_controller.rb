class Api::V1::WidgetsController < Api::V1::ApiController
  respond_to :json

  def index
    @widgets = Widget.all
    if @widgets.present?
      render json: @widgets
    else
      raise ActiveRecord::RecordNotFound
    end
  end

  def show
    @widget = Widget.find(params[:id])
    if @widget.present?
      render json: @widget
    else
      raise ActiveRecord::RecordNotFound
    end
  end
end
