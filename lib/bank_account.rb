class BankAccount
  attr_accessor :name, :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(cash)
    @balance += cash
  end

  def display_balance
    @balance
  end

  def valid?
    if @status == 'open' && @balance > 0
      true
    end
  end

end
