weather_data = {
    "London": {"temperature": "15°C", "conditions": "Cloudy", "wind_speed": "5 km/h", "humidity": "80%"},
    "New York": {"temperature": "20°C", "conditions": "Sunny", "wind_speed": "10 km/h", "humidity": "50%"},
    "Tokyo": {"temperature": "18°C", "conditions": "Rainy", "wind_speed": "7 km/h", "humidity": "90%"},
    "Sydney": {"temperature": "22°C", "conditions": "Windy", "wind_speed": "15 km/h", "humidity": "60%"},
    "Paris": {"temperature": "17°C", "conditions": "Foggy", "wind_speed": "3 km/h", "humidity": "85%"},
    "Algiers": {"temperature": "28°C", "conditions": "Warm", "wind_speed": "4 km/h", "humidity": "75%"},
    "Caracas": {"temperature": "23°C", "conditions": "Mild", "wind_speed": "9 km/h", "humidity": "70%"},
    "Jakarta": {"temperature": "31°C", "conditions": "Hot", "wind_speed": "6 km/h", "humidity": "80%"},
    "Moscow": {"temperature": "9°C", "conditions": "Cold", "wind_speed": "18 km/h", "humidity": "65%"},
    "Nairobi": {"temperature": "34°C", "conditions": "Hot", "wind_speed": "5 km/h", "humidity": "80%"}
} # hardcoded data stored in a dictionary for use in the weather app.

def user_input():
    while True: # while loop will keep looping unless a break is encountered.
        try: # the app will try to run the following code.
            city = input("Please enter one of the following 10 city names. \nLondon, New York, Tokyo, Sydney, Paris, Algiers, Caracas, Jakarta, Moscow, or Nairobi: ").capitalize()
            if city in weather_data: # (above) user is asked for input. .capitalize() ensures no error due to case.
                return city # if the city input is within the above dictionary, that cities data will be displayed, followed by a thank you message. The loop will then break.
            else:
                print(f"Sorry, '{city}' is not in The Weather Forecast App.") # or else (if input does not match with one of the 10 stored cities), a fail notification will print and the loop will start over.
        except Exception as e:
            print(f"An error occurred: {e}") # any other error will be caught with this exception and the while loop will re-run after the specific error message is displayed.

def display_forecast(city): # this function will extract and display the below data for the users choice of city, using dictionary indexing.
    print(f"Weather forecast for {city}:")
    print(f"Temperature: {weather_data[city]['temperature']}")
    print(f"Conditions: {weather_data[city]['conditions']}")
    print(f"Wind speed: {weather_data[city]['wind_speed']}")
    print(f"Humidity: {weather_data[city]['humidity']}")

def forecast_app(): # this function will be used to run the app.
    print("\t\t\tWelcome to The Weather Forecast App!") # user is greeted with a welcome message.
    while True: # a while loop will call the two functions above.
        city = user_input()
        display_forecast(city)
        print("Thank you for using The Weather Forecast App. \nGoodbye.")
        break # if the city input is within the above dictionary, that cities data will be displayed, followed by a thank you message. The loop will then break.

forecast_app() # above function is called and the program begins.