String[] name = {"Aesop", "Agnes", "Alexis", "Bion", "Chloe", "Cleopatra", "Diocles", "Elpis"};

String[] appearance = {"ruddy of face", "an abundant of limbs", "perpetually surprised", "prominent of nose", "heavy of belly", "perky of ear", "flaccid of cheeks", "limp of wrists", "pearly of teeth"};

String[] job = {"acrobat", "sofa sales person", "baker", "Elvis impersonator", "robot dance choreographer"};

JSONArray jsonPeople;

void setup() {

  jsonPeople = new JSONArray();

  // let's make 10 random people
  int people = 10;

  for (int i = 0; i < people; i++) {

    // get a random name
    int randomNameI = int(random(name.length));
    String randomName = name[randomNameI];

    // a random appearance
    int randomAppearanceI = int(random(appearance.length));
    String randomAppearance = appearance[randomAppearanceI];

    // a random job
    int randomJobI = int(random(job.length));
    String randomJob = job[randomJobI];

    // an age between 20 and 99
    int randomAge = int(random(20, 99));

    // up to 3 random friends
    int friends = int(random(4));

    // an array of these friends
    String[] friendsList = new String[friends];

    for (int j = 0; j < friends; j++) {

      int randomFriend = int(random(name.length));
      String potentialFriend = name[randomFriend];

      // check the friend's name is not just the person's name
      // if so, go get another potential friend, loop
      while (potentialFriend.equals(randomName)) {
        randomFriend = int(random(name.length));
        potentialFriend = name[randomFriend];
      }

      // put the person into the array
      friendsList[j] =  potentialFriend;
    }

    // now save this out as a JSONArray, made up of individual JSONObjects
    JSONArray randomPersonFriends = new JSONArray();
    for (int j = 0; j < friendsList.length; j++) {
      JSONObject randomFriend = new JSONObject();
      randomFriend.setString("name", friendsList[j]);
      randomPersonFriends.setJSONObject(j, randomFriend);
    }

    // create a new JSONObject
    JSONObject randomPerson = new JSONObject();

    // set our key, value pairs
    randomPerson.setInt("age", randomAge);
    randomPerson.setString("name", randomName);
    randomPerson.setString("appearance", randomAppearance);
    randomPerson.setString("job", randomJob);
    randomPerson.setJSONArray("friends", randomPersonFriends);

    // add the JSONObject to our JSONArray
    jsonPeople.setJSONObject(i, randomPerson);

    if (friendsList.length > 0) {
      print(randomName +", "+randomAge+", is "+randomAppearance+" in appearance and is gainfully employed as a "+randomJob+". "+randomName+"'s friends are: ");

      for (int j = 0; j < friendsList.length; j++) {
        print(friendsList[j]);
        if (j < friendsList.length-2) {
          print(", ");
        } else if (j == friendsList.length-2) {
          print(", and ");
        } else {
          println(".");
        }
      }
    } else {     
      println(randomName +", "+randomAge+", is "+randomAppearance+" in appearance and is gainfully employed as a "+randomJob+". ");
    }

    // save the overall JSONArray to a file in the data folder
    saveJSONArray(jsonPeople, "data/people.json");
  }
}


void draw() {
}