class ChangeDataTypePhoneNumberInContact < ActiveRecord::Migration[7.0]
  def change
    change_column :contacts, :phone_number, :string
  end
end
