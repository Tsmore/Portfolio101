class User::ReportsController < ApplicationController

  def create
    @report = current_user.reports.build(report_params)
    if @report.save
      redirect_to request.referer, notice: '通報内容を送信しました'
    else
      Rails.logger.debug @report.errors.inspect
      flash[:alert] = @report.errors.full_messages.to_sentence
      redirect_to request.referer, alert: "送信に失敗しました　再度お願いします"
    end
  end

  private

  def report_params
    params.require(:report).permit(:reportable_type, :reportable_id, :reason)
  end

end
