class AddFieldsToUniversity < ActiveRecord::Migration[6.1]
  def change
    add_column :universities, :world_ranking, :string, null: false, default: ''
    add_column :users, :tuition_fee, :string, null: false, default: ''
    add_column :users, :ielts_score, :string, null: false, default: 'not_required'
    add_column :users, :intake, :string, null: false, default: ''
  end
end
