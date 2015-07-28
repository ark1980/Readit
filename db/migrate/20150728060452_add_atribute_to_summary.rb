class AddAtributeToSummary < ActiveRecord::Migration
  def change
    add_column :summaries, :body, :text
  end
end
