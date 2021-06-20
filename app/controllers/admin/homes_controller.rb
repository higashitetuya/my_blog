class Admin::HomesController < ApplicationController
  def top
    @admin = current_admin
  end

  def edit
    @admin = current_admin
  end

  def update
    @admin = current_admin
    @admin.update(admin_params)
    redirect_to admin_path(current_admin)
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :blog, :age, :birthday, :sign, :location, :hobby, :introduction)
  end

end
