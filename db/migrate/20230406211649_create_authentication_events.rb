class CreateAuthenticationEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :authentication_events do |t|
      t.string :email_submitted, null: false
      t.string :event_type, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end