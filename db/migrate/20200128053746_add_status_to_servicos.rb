class AddStatusToServicos < ActiveRecord::Migration[6.0]
  def change
    add_column :servicos, :status, :integer
  end
end
