class FormsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
      @forms = Form.all
  end

  def new
    @form = Form.new
  end

  def create
    @form = Form.new(post_params)

    if @form.save
      redirect_to forms_url
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @form.update(post_params)
      redirect_to forms_url
    else
      render 'new'
    end
  end

  def destroy
    @form.destroy
    redirect_to forms_url
  end


private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @form = Form.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:form).permit(:title, :body)
  end

end
