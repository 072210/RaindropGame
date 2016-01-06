void title() {
  background(0);
  //PFont darkSoul;
  //font = loadFont("");
  //textFont(darkSoul, size);
  text("dearh to henters", width/2, height/2);
}

class Corpse {
  float tall;
  PImage undead;
  PVector loc, velka, accel;

  Corpse(float x, float y) {
    undead = loadImage("");

    loc = new PVector(x, y);
    velka = new PVector(0, random(-3, 3));
    accel = new PVector(0, random(-.5, .5));
  }

  void fall() {
    loc.add(velka);
    velka.add(accel);
  }

  void display() {
    //draw image
  }

  void reset() {
    loc.set(random(width), oscar.height/4);
  }

  boolean conCatcher(Catcher con) {
    if (loc.dist(con.loc) < con.tall/2) {
      return true;
    } else {
      return false;
    }
  }

  boolean conFloor() {
    if (loc.y > height - tall/2) {
      return true;
    } else {
      return false;
    }
  }
}

class Catcher {
  PImage solaire;
  PVector loc;
  float tall = 589;

  Catcher() {
    solaire = loadImage("dark_souls__solaire_by_menaslg-d8izp0x.png");
    loc = new PVector(mouseX, height);
  }

  void display() {
    image(solaire, mouseX, height - solaire.height/8, solaire.width/4, solaire.height/4);
  }
}