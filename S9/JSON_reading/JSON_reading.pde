JSONArray jsonPeople;

void setup() {

  // declare a new JSONArray
  jsonPeople = new JSONArray();

  // load our file contents into it
  jsonPeople = loadJSONArray("data/people.json");

  // now let's break our JSONArray down into individual chunks
  for (int i = 0; i < jsonPeople.size(); i++) {

    // create a JSONObject for the current JSONArray position
    JSONObject person = jsonPeople.getJSONObject(i); 

    // from our JSONObject, grab values in accordance with what we know about key names + structures
    String name = person.getString("name");
    int age = person.getInt("age");
    String appearance = person.getString("appearance");
    String job = person.getString("job");

    // when we encounter arrays in JSONObjects, we need to load it into a JSONArray using getJSONArray method
    JSONArray jfriends = person.getJSONArray("friends");

    String[] friends = new String[jfriends.size()];

    // now let's break our JSONArray down into individual chunks
    for (int j = 0; j < jfriends.size(); j++) {
      // create a JSONObject for the current JSONArray position
      JSONObject jfriend = jfriends.getJSONObject(j);
      friends[j] = jfriend.getString("name");
    }

    if (friends.length > 0) {
      print(name +", "+age+", is "+appearance+" in appearance and is gainfully employed as a "+job+". "+name+"'s friends are: ");
      for (int j = 0; j < friends.length; j++) {
        print(friends[j]);
        if (j < friends.length-2) {
          print(", ");
        } else if (j == friends.length-2) {
          print(", and ");
        } else {
          println(".");
        }
      }
    } else {
      println(name +", "+age+", is "+appearance+" in appearance and is gainfully employed as a "+job+".");
    }
  }
}

void draw() {
}