=begin
Create a terminal app that behaves like an ATM.
includes:
pin
fees
accounts
language

requirements:
withdrawl
check balance
deposit
greetings

MVP = minimal viable product
=end

=begin
greeting then method of menu. Include 'back' button
=end

@balance = 1000.00

puts
puts "Hello, welcome to awesome ATM."

#users encounter menu first and enter their preference
def menu
  puts "Would you like to: \n\n"
  puts "Make a [w]ithdrawal"
  puts "Check your [b]alance"
  puts "Make a [d]eposit"
  puts "E[x]it"
  @input = gets.chomp.downcase

#Depending on user input from menu, the following case will call the respective method
  case @input
    when "w"
      withdrawal
    when "b"
      bal
    when "d"
      deposit
    when "x"
      ex
    else
      puts
      puts "Invalid input, please try again."
      menu
  end
end

#Simple method showing their account balance
def bal
  puts "You have $#{@balance} in your account. \n\n"
  menu #calls the menu method to enable user input again
end

def back
  menu
end

def withdrawal
  puts "How much would you like to withdraw? Press [b] to go back to menu."
  back unless @with == "b"
  #If user goes back to menu, need to stop the rest of the code. Maybe try different variable for back input
  begin
    @with = Integer(gets.chomp.to_f)#This checks if user is inputting valid numbers
    rescue ArgumentError
    puts "Invalid input, please try again"
    retry
  end
  if @with > @balance
    puts "You have insufficient funds. Please enter smaller amount.\n\n"
    withdrawal #If user wants to withdraw more than balance, it will ask for different amount
  else
    @balance -= @with
    puts "Please take your money.\n\n"
    puts "Your remaining balance is $#{@balance}. \n\n"
    menu
  end
end

def deposit
  puts "How much would you like to deposit?"
  begin
    @dep = Integer(gets.chomp.to_f)
    rescue ArgumentError
    puts "Invalid input, please try again"
    retry
  end
  @balance += @dep
  puts "You have deposited $#{@dep} into your account."
  menu
end

#need to figure out how to end program. exit? end?
def ex
  puts
  puts "Thank you for using Awesome ATM. Have a good day :)\n\n"
end

menu
