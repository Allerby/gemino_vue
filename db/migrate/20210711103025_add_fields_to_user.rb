class AddFieldsToUser < ActiveRecord::Migration[6.1]
  change_table :users do |t|
    t.string "social_photo_url"
    t.string "first_name"
    t.string "last_name"
    t.string "google_id"
    t.string "image_url"
    t.string "google_display_name"
    t.string "selected_budget_workflow"
  end
end
