class CreateVagas < ActiveRecord::Migration[7.2]
  def change
    create_table :vagas do |t|
      t.string :titulo
      t.text :descricao
      t.string :empresa

      t.timestamps
    end
  end
end
