# frozen_string_literal: true

class CreteUsers < ActiveRecord::Migration[5.1]
  def change
    create_table 'users', id: 'uuid', primary_key: 'user_id' do |t|
      t.string 'name', null: false, index: { unique: true }
    end
  end
end
