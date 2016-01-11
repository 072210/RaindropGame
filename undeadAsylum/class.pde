//create a function called title()
void title() {
  //it will set the background to black
  background(0);
  //insert a bunch of text that you should enjoy
  text("YOU DIED", width/2, height/2 - 60);
  text("I'm kidding; you've achieved max humanity, dear Solaire of Astora. Congratulations are due.", width/2, height/2 - 30);
  text("Hang on. You stole it from Knight Oscar?! But he was only trying to help you escape...", width/2, height/2);
  text("Fiendish Dark Lord! You're the reason poor Oscar went Hollow!", width/2, height/2 + 30);
  text("- click to restart -", width/2, height - 15);
}

//create a class called Catcher
class Catcher {
  //declare an image, Solaire of Astora
  PImage solaire;
  //declare the location vector of Knight Solaire
  PVector loc;
  //declare the location variables for Solaire's image
  float solX, solY;

  //catcher will be...
  Catcher() {
    //initialise Solaire
    solaire = loadImage("dark_souls__solaire_by_menaslg-d8izp0x.png");
    //initialise Solaire's location vector
    loc = new PVector(mouseX, height);
  }

  //create a function to display Solaire
  void display() {
    //initialise Solaire's image coordinates
    solX = mouseX;
    solY = height - solaire.height/8;
    //draw Solaire there
    image(solaire, solX, solY, solaire.width/4, solaire.height/4);
  }
}

//create a class called Corpse
class Corpse {
  //declare an image for Humanity
  PImage humanity;
  //declare its location, velocity, and acceleration vectors
  PVector loc, velka, accel;

  //corpse has parameters x, y for location
  Corpse(float x, float y) {
    //initialise Humanity... erm...
    humanity = loadImage("2112.png");

    //initialise location, velocity, and acceleration vectors
    loc = new PVector(x, y);
    velka = new PVector(0, random(10));
    accel = new PVector(0, random(.5));
  }

  //create a function for the Humanity to fall
  void fall() {
    //add things to each other for physics
    loc.add(velka);
    velka.add(accel);
  }

  //create a function to display the Humanity in-game
  void display() {
    //yes, display that Humanity; it's mine now, you Darkwraith
    image(humanity, loc.x, loc.y);
  }

  //create a boolean to tell if Humanity went offscreen
  boolean bottom() {
    //if it has left us
    if (loc.y > height + 90) {
      return true;
    } else {
      return false;
    }
  }

  //create a boolean to tell if Humanity is touching Solaire
  boolean contact() {
    //if Humanity is within Solaire's boundaries
    if (loc.x >= mouseX - 85 && loc.x <= mouseX + 85 && loc.y >= height - 280) {
      return true;
    } else {
      return false;
    }
  }
}