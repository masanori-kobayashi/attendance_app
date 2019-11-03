class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :correct_user, only: [:edit]
  before_action :admin_user, only: [:destroy, :edit_basic_info, :update_basic_info]
  before_action :set_one_month, only: :show

  def index
    @users = User.paginate(page: params[:page])
    if params[:name].present? 
      @users = @users.get_by_name params[:name]
    end
  end
  
  def import
   # fileはtmpに自動で一時保存される
   if params[:file].blank?
     flash[:danger] = "インポートするCSVファイルを選択してください。"
     redirect_to users_url
   else
     User.import(params[:file])
     flash[:success] = "CSVファイルをインポートしました。"
     redirect_to users_url
   end
  end

  def show
    @worked_sum = @attendances.where.not(started_at: nil).count
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to @user
    else
      render :edit      
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end

  def edit_basic_info
  end

  def update_basic_info
    if @user.update_attributes(basic_info_params)
      flash[:success] = "#{@user.name}の基本情報を更新しました。"
    else
      flash[:danger] = "#{@user.name}の更新は失敗しました。<br>" + @user.errors.full_messages.join("<br>")
    end
    redirect_to users_url
  end
  
  def attendance_within_employee
    @working_users = User.all.includes(:attendances)
    .where(attendances: {worked_on: Date.today})
    .where.not(attendances: {started_at: nil?})
    .where(attendances: {finished_at: nil})
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :affiliation, :password, :password_confirmation)
    end

    def basic_info_params
      params.require(:user).permit(:name, :email, :affiliation, :employee_number, :uid, :password, :password_confirmation,
                                   :basic_work_time, :designated_work_start_time, :designated_work_end_time)
    end
end

#@working_users = Attendance.where(started_at: present?).where(finished_at: nil?) && Date.today

