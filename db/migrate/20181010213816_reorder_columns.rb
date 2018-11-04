class ReorderColumns < ActiveRecord::Migration[5.1]
  def change
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")

    #addresses
    change_column :addresses, :Appartment, :string

    #customers
    change_column :customers, :created_at, :datetime, after: :Tech_email
    change_column :customers, :updated_at, :datetime, after: :created_at

    
  end
end
