class Backend::BaseController < ApplicationController
  layout 'backend'
  helper_method :current_collection, :current_object
  before_action :logged_in_user

  USE_PAGER = true

  def index
  end

  def new
    @current_object = collection_scope.new
  end

  def create
    @current_object = collection_scope.create(object_params)
    respond_to do |f|
      f.html do
        if @current_object.errors.empty?
          flash[:success] = t('flash.successfully_created')
          redirect_to url_after_create
        else
          flash[:error] = t('flash.cannot_create')
          render action: :new
        end
      end
      f.json
    end
  end

  def destroy
    current_object.destroy
    respond_to do |f|
      f.html do
        flash[:success] = t('flash.successfully_destroyed')
        redirect_to url_after_destroy
      end
      f.json
    end
  end

  def edit
  end

  def update
    if current_object.update(object_params)
      respond_to do |f|
        f.html do
          if current_object.errors.empty?
            flash[:success] = t('flash.successfully_updated')
            redirect_to url_after_update
          else
            flash[:error] = t('flash.cannot_update')
            render action: :edit
          end
        end
        f.json
      end
    else
      respond_to do |f|
        f.html do
          render action: :edit
        end
        f.json
      end
    end
  end

  private

  def url_after_create
    request.env['HTTP_REFERER'] || url_for(action: :index)
  end

  alias url_after_update url_after_create
  alias url_after_destroy url_after_create

  def collection_scope
    # You should implement it in your controller
  end

  def object_params
    # You should implement it in your controller
  end

  def current_collection
    @collection ||= self.class.const_get(:USE_PAGER) ? collection_scope.page(params[:page]) : collection_scope.all
  end

  def current_object
    @current_object ||= collection_scope.find(params[:id])
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      flash[:back_url] = request.url
      redirect_to login_url
    end
  end


end
