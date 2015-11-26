class AddColumnUserEmailForOrder < ActiveRecord::Migration
  def change
    add_column :orders, :email_user, :string
  end
end
