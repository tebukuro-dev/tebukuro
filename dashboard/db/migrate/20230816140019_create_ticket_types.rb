class CreateTicketTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :ticket_types do |t|
      t.string :name, null: false
      t.integer :limit_number, null: false, default: 1
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end

    add_index :ticket_types, [:name, :event_id], unique: true
  end
end
