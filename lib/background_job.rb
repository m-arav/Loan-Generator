class BackgroundJob
  attr_accessor :progress, :message

  def initialize
    # Instance variables
    @progress = 0
  end

  def run
    j=0
    nums = ["Creating User", "Creating Loan", "Calcuating Loan", "Tidying Up", "Loading The Universe", "All Done"]
    10.times do |i|
      puts "Inside count"
      @message = nums[j]
      @progress = (i+1) * 10
      sleep(1)
      j+=1 if i%2 == 0
    end
  end
end
