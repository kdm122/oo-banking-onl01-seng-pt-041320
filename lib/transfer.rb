class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'

  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if @sender.status == 'closed' || @sender.balance < @amount || @receiver.status == 'closed'
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    elsif @status == 'pending'
      @status = 'complete'
      @sender.deduct(@amount)
      @receiver.deposit(@amount)
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @status = 'reversed'
      @sender.deposit(@amount)
      @receiver.deduct(@amount)
      else
        return 'NOPE'
      end
  end


end
