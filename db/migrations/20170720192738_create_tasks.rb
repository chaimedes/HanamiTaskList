Hanami::Model.migration do
  change do
    create_table :tasks do
      primary_key :id
      foreign_key :user_id, :users

      column :title, String, null: false
      column :description, String, null: true
      column :importance, Integer, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
