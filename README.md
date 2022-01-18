# How to Install Ruby
To install Ruby in your Ubuntu, you can enter the following commands in your terminal
```
\curl -sSL https://get.rvm.io | bash -s stable
command curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
command curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
\curl -sSL https://get.rvm.io | bash -s stable
source /home/your_user/.rvm/scripts/rvm
rvm install ruby-3.1.0
rvm use 3.1.0 --default
echo "source $HOME/.rvm/scripts/rvm" >> ~/.bash_profile
```
When you enter the command
```
which ruby
```
the result shown should be
```
/home/your_user/.rvm/rubies/ruby-3.1.0/bin/ruby
```

# How to Run the Aplication
You can run the application just openning the terminal and insert the following command
```
ruby main.rb
```

# How to Run the Test
You can run the test file getting into the directory and enter the command
```
bin/rspec
```
