class UploadCsvController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def upload
    
  end

  private

    def upload_params
      params.permit(:bank, :file)
    end
end
