JSONArray json;

void setup() {

  loadJSONData();
}


void loadJSONData() {

  // let's load some JSON from http://ip-api.com/json
  JSONObject json = loadJSONObject("http://ip-api.com/json"); 
  String city = json.getString("city");
  String IP = json.getString("query");
  println("Hello there, I see you are from "+city+" and your IP address is "+IP);
}

void draw() {
}