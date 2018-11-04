class RenameQuotePhoneToEmail < ActiveRecord::Migration[5.1]
  def change
    rename_column :quotes, :phone, :email
  end
end
