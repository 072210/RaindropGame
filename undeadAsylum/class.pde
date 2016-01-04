void title() {
  background(0);
  
}

class Corpse {
  PVector loc, velka, accel;

  Corpse(float x, float y) {
    //image

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
    loc.set(random(width), 0);
  }

  boolean conCatcher(Catcher con) {
    if () {
      return true;
    } else {
      return false;
    }
  }

  boolean conFloor() {
  }
}

class Catcher {
  PVector loc;

  Catcher() {
    loc = new PVector(mouseX, height);
  }

  void display() {
    //load image
  }
}