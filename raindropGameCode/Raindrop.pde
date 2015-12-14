class Raindrop {
  float diam;
  PVector loc, velka, accel;

  Raindrop(float x, float y) {
    noStroke();
    smooth();
    fill(150);

    loc = new PVector(x, y);
    velka = new PVector(0, random(-1, 1));
    accel = new PVector(0, random(-.5, .5));
  }

  void fall() {
    loc.add(velka);
    accel.add(accel);
  }

  void display() {
    diam = 20 + random(-1.5, 1.5);
    ellipse(loc.x, loc.y, diam, diam);
  }

  boolean isInContactWith(PVector con) {
    if (loc.dist(con) < diam/2) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    loc.set(random(width), 0);
  }
}