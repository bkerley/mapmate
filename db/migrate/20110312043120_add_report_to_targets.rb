class AddReportToTargets < ActiveRecord::Migration
  def self.up
    add_column :targets, :report, :text
  end

  def self.down
    remove_column :targets, :report
  end
end
