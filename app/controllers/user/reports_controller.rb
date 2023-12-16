class User::ReportsController < ApplicationController

  def create
    @report = current_user.reports.build(report_params)
    if @report.save
      redirect_to request.referer, notice: '通報が完了しました'
    else
      Rails.logger.debug @report.errors.inspect
      flash[:alert] = @report.errors.full_messages.to_sentence
      redirect_to request.referer
    end
  end

  private

  def report_params
    params.require(:report).permit(:reportable_type, :reportable_id, :reason)
  end

end
