class AddMissingDatabaseFields < ActiveRecord::Migration[5.1]
  def change
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")

    #leads
    add_column :leads, :File, :binary, :after => :Message
    
    #addresses
    change_column :addresses, :Appartment, :integer

    #customers
    change_column :customers, :Creation_date, :datetime

    rename_column :customers, :Headquarters, :Headquarter
    change_column :customers, :Headquarter, :integer
    
    rename_column :customers, :Full_name, :Contact_full_name

    add_column :customers, :Contact_phone, :string
    add_column :customers, :Contact_email, :string
    add_column :customers, :Business_description, :string
    add_column :customers, :Tech_full_name, :string
    add_column :customers, :Tech_phone, :string
    add_column :customers, :Tech_email, :string

    #batteries
    rename_column :batteries, :Commissionning, :Commissioning
    change_column :batteries, :Last_Inspection, :datetime

    #elevators
    rename_column :elevators, :Series, :Serial_number
    change_column :elevators, :Serial_number, :string
    rename_column :elevators, :Modal, :Model

    change_column :elevators, :Start_date, :datetime
    change_column :elevators, :Last_check, :datetime

  end
end
