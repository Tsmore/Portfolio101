class Admin::ReportsController < ApplicationController

  def index
    @reports = Report.all.order(created_at: :desc).limit(5)
  end

  def show
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    @report.processed = !@report.processed

    if @report.save
      redirect_to admin_report_path(@report), notice: 'ステータスが更新されました'
    else
      redirect_to admin_report_path(@report), alert: 'ステータスの更新に失敗しました'
    end
  end
end
