class AddMobileDigestToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :mobile_digest, :string
  end
end
