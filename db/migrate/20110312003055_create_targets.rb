class CreateTargets < ActiveRecord::Migration
  def self.up
    create_table :targets do |t|
      t.string :address

      t.timestamps
    end
  end

  def self.down
    drop_table :targets
  end
end
