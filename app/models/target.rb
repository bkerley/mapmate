class Target < ActiveRecord::Base
  validates_presence_of :address
  after_create :add_scanner_to_queue

  private
  def add_scanner_to_queue
    Resque.enqueue(Scan, self.id)
  end
end
