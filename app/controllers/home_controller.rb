class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :go_to_upload, only: :index

  def go_to_upload
    # we don't want to automatically redirect if the user hit the 'previous' btn.
    return if request&.referer&.include?("upload_csv")
    redirect_to upload_csv_index_path if current_user.selected_budget_workflow.present?
  end

  def choose_tool
    current_user.selected_budget_workflow = params[:tool]
    current_user.save

    render :json => { redirect_path: upload_csv_index_path }
  end
end
