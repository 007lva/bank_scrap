require 'thor'

module BankScrap
  class Cli < Thor

    desc "balance BANK", "get account's balance"
    option :user
    option :password
    option :debug, default: false

    def balance(bank)

      @user = options[:user]
      @password = options[:password]
      @debug = options[:debug]

      bank_class = Object.const_get(bank)

      @client = bank_class.new(@user, @password, debug: @debug)

      balance = @client.get_balance

      puts "Balance: #{balance}"
    rescue NameError
      puts "Invalid bank: #{bank}"
    end

  end
end