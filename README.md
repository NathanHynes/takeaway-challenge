Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

This weeks challenge was to create a program that would mimic a takeaway. The main tasks were allowing a user to:  
* View a menu.
* Add items to an order.
* Check order total.
* receive a text confirming delivery time.

## User Stories
```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

## My Approach


Using the processes and techniques I learnt during the week, such as Polymorphism and Extracting classes, during the planning stage I decided that I would have classes dedicated to the following:
* Orders
* Menu
* Messenger
* Takeaway

The Takeaway class is more of an 'interface' calling on the other tasks to carry out functions and is where the user interacts with all other classes.

I also wanted to make sure that class methods didn't have too many responsibilities and thus decided early on to follow SRP and calling on private methods to carry out additional functionality where needed.


## How to use my program

### Set up

Before using the program you will need to sign up for an account on https://www.twilio.com/ in order to make use of the Messenger class to send texts to a customers phone.

Once you have account I would recommend creating the following environment variables:

* TWILIO_TO - A customer mobile number to recieve SMSs
* TWILIO_FROM - A verified sending number from Twilio
* TWILIO_SID - Twilio  account SID
* TWILIO_TOKEN - Twilio authentication token.


### Using the program

To use the program you will need to fork this repo and run `bundle install` to install the required gems. Then type `require './lib/takeaway.rb'` in IRB.

 before creating an instance of the Takeaway Class first create a list of dishes. You will then need to pass them in as an argument to an instance of a Menu class that the Takeaway class needs to initialise.

```
sample_menu = { MARGHERITA: 3, FUNGHI: 4, FIORENTINA: 5, FORMAGGI: 5, PEPPERONI: 6 }

restaurant = Takeaway.new(menu:Menu(sample_menu))
```
This creates a new instance of the Takeaway class with a preloaded menu. During initialisation an instance of an Order class and Messenger class will also be created.

To view the menu in a readable string you simply need to type the following:

```
restaurant.view_menu
```

Should you want to add to the menu `restaurant.add_to_menu('bread', 2)`. The arguments you pass should be the item you wish to add and the price.

To add items to your order you will then need to type the following:

```
restaurant.add_to_order("FUNGHI", 3)
```
You will need to specify the item that you  want to be added to the order and also the quantity. If a quantity isn't passed this will be 1 by default. If the menu doesn't include the item an error message will be displayed.

To view your order and have it printed to output simply type `restaurant.view_order`.

Once you have completed your order checkout by typing `restaurant.checkout(20)`. The number you pass as an argument needs to be the total price of the order. If it isn't another error message will be displayed. This will complete the order and send you a text to confirm a delivery time.


## Challenges

This weekend challenge really helped me get to grip and overcome issues with RSPEC testing especially when it came to mocking and stubbing. I spent quite a lot of time researching this and ensuring I got it right. It also helped improve my testing and approach to planning.

## Improvements to implement

 One major improvement I would add to the program would be the ability to load a CSV file as a menu. Furthermore the takeaway class is a bit redundant as it is delegating quite a lot of its responsibilities. If I was to do this again I would consider combining the order and takeaway classes into one. 
