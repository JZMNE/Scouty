# import libraries
import joblib
import pandas as pd

# import model
model = joblib.load('sk_olympics.pkl')
model

def AthletePred():
    """
    Predict the probability of an athlete to win either Gold, Silver, Bronze or No Medal in the Olympics.
    
    Inputs:
    - Age: Integer representing the athlete's age
    - Sex: String representing the athlete's sex (M or F)
    - Height: Integer representing the athlete's height in centimetres
    - Weight: Integer representing the athlete's weight in pounds
    - Country: String representing the athlete's country
    - Host City: String representing the Olympics host city
    - Sport Discipline: String representing the athlete's sport discipline
    
    Returns:
    - A string indicating the predicted medal for the athlete (Gold, Silver, Bronze, or None)
    
    ## Value

    Country:'Afghanistan', 'Albania', 'Algeria', 'American Samoa', 'Andorra', 'Angola', 'Antigua',
    'Argentina', 'Armenia', 'Aruba', 'Australia', 'Austria', 'Azerbaijan', 'Bahamas', 'Bahrain',
    'Bangladesh', 'Barbados', 'Belarus', 'Belgium', 'Belize', 'Benin', 'Bermuda', 'Bhutan', 'Boliva',
    'Bosnia and Herzegovina', 'Botswana', 'Brazil', 'British Virgin Islands', 'Brunei', 'Bulgaria',
    'Burkina Faso', 'Burundi', 'Cambodia', 'Cameroon', 'Canada', 'Cape Verde', 'Cayman Islands',
    'Central African Republic', 'Chad', 'Chile', 'China', 'Colombia', 'Comoros', 'Cook Islands',
    'Costa Rica', 'Croatia', 'Cuba', 'Curacao', 'Cyprus', 'Czech Republic', 'Democratic Republic of the Congo',
    'Denmark', 'Djibouti', 'Dominica', 'Dominican Republic', 'East Timor', 'Ecuador', 'Egypt',
    'El Salvador', 'Equatorial Guinea', 'Eritrea', 'Estonia', 'Ethiopia', 'Fiji', 'Finland', 'France',
    'Gabon', 'Gambia', 'Georgia', 'Germany', 'Ghana', 'Great Britain', 'Greece', 'Grenada', 'Guam',
    'Guatemala', 'Guinea', 'Guinea-Bissau', 'Guyana', 'Haiti', 'Honduras', 'Hong Kong', 'Hungary',
    'Iceland', 'India', 'Indonesia', 'Individual Olympic Athletes', 'Iran', 'Iraq', 'Ireland', 'Israel',
    'Italy', 'Ivory Coast', 'Jamaica', 'Japan', 'Jordan', 'Kazakhstan', 'Kenya', 'Kiribati', 'Kosovo',
    'Kuwait', 'Kyrgyzstan', 'Laos', 'Latvia', 'Lebanon', 'Lesotho', 'Liberia', 'Libya', 'Liechtenstein',
    'Lithuania', 'Luxembourg', 'Macedonia', 'Madagascar', 'Malawi', 'Malaysia', 'Maldives', 'Mali', 'Malta',
    'Marshall Islands', 'Mauritania', 'Mauritius', 'Mexico', 'Micronesia', 'Moldova', 'Monaco', 'Mongolia',
    'Montenegro', 'Morocco', 'Mozambique', 'Myanmar', 'Namibia', 'Nauru', 'Nepal', 'Netherlands',
    'New Zealand', 'Nicaragua', 'Niger', 'Nigeria', 'North Korea', 'Norway', 'Oman', 'Pakistan', 'Palau',
    'Palestine', 'Panama', 'Papua New Guinea', 'Paraguay', 'Peru', 'Philippines', 'Poland', 'Portugal',
    'Puerto Rico', 'Qatar', 'Republic of the Congo', 'Romania', 'Russia', 'Rwanda', 'Saint Kitts',
    'Saint Lucia', 'Saint Vincent', 'Samoa', 'San Marino', 'Sao Tome and Principe', 'Saudi Arabia',
    'Senegal', 'Serbia', 'Seychelles', 'Sierra Leone', 'Singapore', 'Slovakia', 'Slovenia,
    'Solomon Islands','Somalia','South Africa','South Korea','South Sudan','Spain','Sri Lanka', 'Sudan',
    'Swaziland','Sweden','Switzerland','Syria','Taiwan','Tajikistan','Tanzania', 'Thailand', 'Timor-Leste',
    'Togo', 'Tonga', 'Trinidad', 'Tunisia', 'Turkey', 'Turkmenistan', 'UK', 'USA', 'Uganda', 'Ukraine',
    'United Arab Emirates', 'Uruguay', 'Uzbekistan', 'Vanuatu', 'Venezuela', 'Vietnam', 'Virgin Islands, British',
     'Virgin Islands, US', 'Yemen', 'Zambia', 'Zimbabwe'}


    
    Sport Discipline: 'Alpine Skiing', 'Archery', 'Art Competitions', 'Athletics', 'Aeronautics',
    'Badminton', 'Baseball', 'Basketball', 'Basque Pelota', 'Beach Volleyball', 'Biathlon', 'Bobsleigh',
    'Boxing', 'Cricket', 'Cross Country Skiing', 'Croquet', 'Curling', 'Cycling', 'Canoeing', 'Diving',
    'Equestrianism', 'Fencing', 'Figure Skating', 'Football', 'Freestyle Skiing', 'Golf', 'Gymnastics',
    'Handball', 'Hockey', 'Ice Hockey', 'Jeu De Paume', 'Judo', 'Lacrosse', 'Luge', 'Military Ski Patrol',
    'Modern Pentathlon', 'Motorboating', 'Nordic Combined', 'Polo', 'Racquets', 'Roque', 'Rowing', 'Rugby',
    'Rugby Sevens', 'Sailing', 'Shooting', 'Short Track Speed Skating', 'Skeleton', 'Ski Jumping',
    'Snowboarding', 'Softball', 'Speed Skating', 'Synchronized Swimming', 'Swimming', 'Table Tennis',
    'Taekwondo', 'Tennis', 'Trampolining', 'Triathlon', 'Tug-Of-War', 'Volleyball', 'Water Polo', 'Weightlifting',
    'Wrestling'
    
    Host City: 'Albertville', 'Amsterdam', 'Antwerpen', 'Athina', 'Atlanta', 'Barcelona', 'Beijing',
    'Berlin', 'Calgary', 'Chamonix', "Cortina d'Ampezzo", 'Garmisch-Partenkirchen', 'Grenoble', 'Helsinki',
    'Innsbruck', 'Lake Placid', 'Lillehammer', 'London', 'Los Angeles', 'Melbourne', 'Mexico City',
    'Montreal', 'Moskva', 'Munich', 'Nagano', 'Oslo', 'Paris', 'Rio de Janeiro', 'Roma', 'Sankt Moritz',
    'Sapporo', 'Sarajevo', 'Seoul', 'Sochi', 'Squaw Valley', 'St. Louis', 'Stockholm', 'Sydney',
    'Salt Lake City', 'Tokyo', 'Turin', 'Vancouver'

    """
    
    age    = input("Enter the Athlete's Age: ")
    sex    = input("Enter the Athlete's Sex - M or F: ")
    height = input("Enter the Athlete's Height cm: ")
    weight = input("Enter the Athlete's Weight lbs: ")
    region = input("Enter the Athlete's Country: ")
    city   = input("Enter the Olympics Host City:")
    sport  = input("Enter the Athlete's Sport Discipline: ")
    
    # Convert inputs to a pandas DataFrame
    data = pd.DataFrame([int(age), str(sex), int(height), int(weight), str(region),str(city), str(sport)], index =['Age', 'Sex', 'Height', 'Weight', 'region', 'City', 'Sport'])
    data = data.T
    
    # Use a pre-trained machine learning model to predict the athlete's medal
    predicted_medal = model.predict(data)[0]
    
    if predicted_medal == 'Gold':
        return 'Congratulations! You are 86% likely to win a Gold Medal!'
    elif predicted_medal == 'Silver':
        return 'You are 86% likely to a Silver Medal!'
    elif predicted_medal == 'Bronze':
        return 'You are 86% likely to a Bronze Medal! Hey, Some dunderhead predictions'
    else:
        return 'Unfortunately, You are 86% likely not to win a medal. Hey, it is just a model'