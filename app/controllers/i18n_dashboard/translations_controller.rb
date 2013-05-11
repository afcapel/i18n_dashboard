require_dependency "i18n_dashboard/application_controller"

module I18nDashboard
  class TranslationsController < ApplicationController

    def index
       @translations = Translation.all(params[:query])
    end

    def create
      Translation.create(params[:key], params[:value], params[:locale])
      redirect_to root_path, :notice => "Added translations"
    end

    def destroy
      Translation.destroy(params[:id])
      redirect_to root_path, :notice => "Key deleted"
    end

  end
end
