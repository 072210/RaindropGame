void title() {
  background(0);
  //PFont darkSoul;
  //font = loadFont("");
  //textFont(darkSoul, size);
  textAlign(CENTER);
  text("death to henters keh heh heh", width/2, height/2);
}

class Corpse {
  PImage humanity;
  PVector loc, velka, accel;

  Corpse(float x, float y) {
    humanity = loadImage("2112.png");

    loc = new PVector(x, y);
    velka = new PVector(0, random(10));
    accel = new PVector(0, random(.5));
  }

  void fall() {
    loc.add(velka);
    velka.add(accel);
  }

  void display() {
    image(humanity, loc.x, loc.y);
  }

  void reset() {
    loc.set(dropLoc, oscar.height/4);
  }

  boolean bottom() {
    if (loc.y > height - 1178) {
      return true;
    } else {
      return false;
    }
  }
}

class Catcher {
  PImage solaire;
  PVector loc;

  Catcher() {
    solaire = loadImage("dark_souls__solaire_by_menaslg-d8izp0x.png");
    loc = new PVector(mouseX, height);
  }

  void display() {
    image(solaire, mouseX, height - solaire.height/8, solaire.width/4, solaire.height/4);
  }
}