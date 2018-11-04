class UpdateFileToLead < ActiveRecord::Migration[5.1]
  def up
    change_column :leads, :File, :binary, :limit => 5.megabytes
  end

  def down
    change_column :leads, :File, :binary
  end
end
