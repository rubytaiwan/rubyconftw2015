class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  attr_writer :page_title
  helper_method :page_title

  private
  def page_title
    @page_title =
    begin
      #I18n.t "page_title.#{controller_name}.#{action_name}", raise: true
      I18n.t "page_title.#{controller_path}.#{action_name}", raise: true
    rescue I18n::MissingTranslationData
      t('page_title.default')
    end
  end
end
