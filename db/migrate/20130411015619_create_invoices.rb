class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :project_id

      t.timestamps
    end

    add_column :entries, :invoice_id, :integer
  end
end
