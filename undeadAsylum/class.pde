void title() {
  background(0);
  //PFont darkSoul;
  //font = loadFont("");
  //textFont(darkSoul, size);
  textAlign(CENTER);
  text("death to henters keh heh heh", width/2, height/2);
}

class Catcher {
  PImage solaire;
  PVector loc;
  float solX, solY;

  Catcher() {
    solaire = loadImage("dark_souls__solaire_by_menaslg-d8izp0x.png");
    loc = new PVector(mouseX, height);
    solX = mouseX;
    solY = height - solaire.height/8;
  }

  void display() {
    image(solaire, solX, solY, solaire.width/4, solaire.height/4);
  }
}

class Corpse {
  PImage humanity;
  PVector loc, velka, accel;
  float score;

  Corpse(float x, float y) {
    humanity = loadImage("2112.png");

    loc = new PVector(x, y);
    velka = new PVector(0, random(10));
    accel = new PVector(0, random(.5));
    
    score = 0;
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

  void bottom() {
    if (loc.y > height - 1178) {
      reset();
    }
  }

  boolean contact() {
    if (loc.x > mouseX - 147 && loc.x < mouseX + 147 && loc.y > 170) {
      return true;
    } else {
      return false;
    }
  }

  boolean scoreCalc() {
    if (contact()) {
      return true;
    } else {
      return false;
    }
  }

  void scoring() {
    textAlign(CENTER);
    text(score, width/2, height/2);
  }
}