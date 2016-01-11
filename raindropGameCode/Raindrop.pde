class Raindrop {
  float diam, c;
  PVector loc, velka, accel;

  Raindrop(float x, float y) {
    noStroke();
    smooth();

    c = random(10);
    fill(206 + c, 200 + c, 147 + c);

    loc = new PVector(x, y);
    velka = new PVector(0, random(-1, 1));
    accel = new PVector(0, random(-.5, .5));
  }

  void fall() {
    loc.add(velka);
    accel.add(accel);
  }

  void display() {
    diam = 2 + random(-1.5, 1.5);
    ellipse(loc.x, loc.y, diam, diam);
  }

  boolean isInContactWith(Catcher con) {
    if (loc.dist(con.loc) < con.diam/2) {
      return true;
    } else {
      return false;
    }
  }

  boolean shouldBeDead() {
    if (loc.y > height - diam/2) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    loc.set(random(width), 0);
  }
}

class Catcher {
  PVector loc;
  int diam;

  Catcher(int tDiam) {
    loc = new PVector(mouseX, mouseY);
    diam = tDiam;
  }

  void there() {
    ellipse(loc.x, loc.y, diam, diam);
  }
}