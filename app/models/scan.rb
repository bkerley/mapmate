class Scan
  @queue = 'scanner'

  def self.perform(target_id)
    self.new(target_id).run
  end

  def initialize(target_id)
    @target = Target.find target_id
    @address = @target.address
  end

  def run
    scan
    save
  end

  def scan
    Open3.popen3('nmap', '-iL', '-') do |i,o,e,t|
      i.puts @address
      i.close
      @report = o.read
    end
  end

  def save
    @target.report = @report
    @target.save
  end
end
