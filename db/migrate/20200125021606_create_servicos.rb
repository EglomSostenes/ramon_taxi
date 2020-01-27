class CreateServicos < ActiveRecord::Migration[6.0]
  def change
    create_table :servicos do |t|
      t.string :nome
      t.string :email
      t.string :fone
      t.datetime :inicio
      t.datetime :fim

      t.timestamps
    end
  end
end
