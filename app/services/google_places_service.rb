class GooglePlacesService
  attr_reader :client, :transaction

  def initialize
    @client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_API_KEY'])
    @other_category = Category.find_by(name: 'Other')
  end

  def call(transaction)
    @transaction = transaction
    search_string = transaction_search_string
    google_api_category = search_places(search_string).first&.types&.first&.to_sym

    category = Category.find_by(name: category_map[google_api_category])
    transaction.google_places_category = google_api_category.to_s
    transaction.prospective_category_id = if category
                                            category.id
                                          else
                                            @other_category.id
                                          end
  end

  private

  def search_places(search_string)
    client.spots_by_query(search_string)
  end

  def transaction_search_string
    transaction.details.split(' ')[0..-3].join(' ')
  end

  def category_map
    {
      accounting: 'Bills',
      airport: 'Travel',
      amusement_park: 'Entertainment',
      aquarium: 'Entertainment',
      art_gallery: 'Entertainment',
      atm: 'Savings',
      bakery: 'Takeaways',
      food: 'Takeaway',
      bank: 'Bank fee',
      bar: 'Alcohol',
      beauty_salon: 'Hair',
      bicycle_store: 'Transport',
      book_store: 'Books',
      bowling_alley: 'Entertainment',
      bus_station: 'Transport',
      cafe: 'Coffee',
      campground: 'Travel',
      car_dealer: 'Car',
      car_rental: 'Rental Car',
      car_repair: 'Car',
      car_wash: 'Car',
      casino: 'Entertainment',
      cemetery: 'Other',
      church: 'Religion',
      city_hall: 'Other',
      clothing_store: 'Clothes',
      convenience_store: 'Dairy',
      courthouse: 'Bills',
      dentist: 'Dentist',
      department_store: 'Shopping',
      doctor: 'Doctor',
      drugstore: 'Pharmacy',
      electrician: 'Renovations',
      electronics_store: 'Electronics',
      embassy: 'Entertainment',
      fire_station: 'Bills',
      florist: 'Gifts',
      funeral_home: 'Bills',
      furniture_store: 'Housing',
      gas_station: 'Gas and Fuel',
      gym: 'Gym',
      hair_care: 'Hair',
      hardware_store: 'Renovations',
      hindu_temple: 'Religion',
      home_goods_store: 'Shopping',
      hospital: 'Doctor',
      insurance_agency: 'Insurance',
      jewelry_store: 'Shopping',
      laundry: 'Laundry',
      lawyer: 'Bills',
      library: 'Books',
      light_rail_station: 'Transport',
      liquor_store: 'Alcohol',
      local_government_office: 'Other',
      locksmith: 'Housing',
      lodging: 'Hotel, Airbnb, Accommodation',
      meal_delivery: 'Takeaways',
      meal_takeaway: 'Takeaways',
      mosque: 'Religion',
      movie_rental: 'Subscriptions',
      movie_theater: 'Cinema',
      moving_company: 'Transport',
      museum: 'Entertainment',
      night_club: 'Entertainment',
      painter: 'Renovations',
      park: 'Entertainment',
      parking: 'Parking',
      pet_store: 'Pets',
      pharmacy: 'Pharmacy',
      physiotherapist: 'Sports',
      plumber: 'Renovations',
      police: 'Other',
      post_office: 'Other',
      primary_school: 'School tuition',
      real_estate_agency: 'Housing',
      restaurant: 'Restaurants',
      roofing_contractor: 'Renovations',
      rv_park: 'Car',
      school: 'School tuition',
      secondary_school: 'School tuition',
      shoe_store: 'Clothes',
      shopping_mall: 'Clothes',
      spa: 'Spa and Massage',
      stadium: 'Entertainment',
      storage: 'Housing',
      store: 'Other',
      subway_station: 'Transport',
      supermarket: 'Groceries',
      grocery_or_supermarket: 'Groceries',
      synagogue: 'Religion',
      taxi_stand: 'Uber',
      tourist_attraction: 'Travel',
      train_station: 'Transport',
      transit_station: 'Transport',
      travel_agency: 'Travel',
      university: 'School tuition',
      veterinary_care: 'Pets',
      zoo: 'Entertainment'
    }
  end
end
