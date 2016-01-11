void title() {
  background(0);
  //PFont darkSoul;
  //font = loadFont("");
  //textFont(darkSoul, size);
  textAlign(CENTER);
  textSize(20);
  text("YOU DIED", width/2, height/2 - 60);
  text("I'm kidding; you've achieved max humanity, dear Solaire of Astora. Congratulations are due.", width/2, height/2 - 30);
  text("Hmm, wait - you stole it from Knight Oscar?! How dare you! He was only trying to help you escape...", width/2, height/2);
  text("Fiendish Dark Lord! You're the reason poor Oscar went Hollow!", width/2, height/2 + 30);
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
    solX = mouseX;
    solY = height - solaire.height/8;
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

  boolean bottom() {
    if (loc.y > height + 90) {
      return true;
    } else {
      return false;
    }
  }

  boolean contact() {
    if (loc.x >= mouseX - 85 && loc.x <= mouseX + 85 && loc.y >= height - 280) {
      return true;
    } else {
      return false;
    }
  }

  void scoreAdd() {
    if (contact()) {
      score += 1;
    }

    println(score);
    textAlign(CENTER);
    text(score + " / 99 Humanity", width/2, height/2);

    if (score == 99) {
      unlock = !unlock;
    }
  }
}