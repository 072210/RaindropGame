boolean unlock = false;
float dropLoc;
PImage oscar;
PVector mouse;

ArrayList<Corpse> c = new ArrayList<Corpse>();
Catcher chosenUndead;

void setup() {
  size(1400, 800);
  frameRate(10);
  title();

  imageMode(CENTER);
  oscar = loadImage("19912_dark_souls_black.jpg");

  mouse = new PVector();
  c.add(new Corpse(mouseX, mouseY));
}

void draw() {
  dropLoc = random(width);

  if (!unlock) {
    title();
  }

  if (unlock) {
    background(0);
    mouse.set(mouseX, mouseY);

    image(oscar, dropLoc, oscar.height/8, oscar.width/4, oscar.height/4);

    chosenUndead = new Catcher();
    chosenUndead.display();

    Corpse c = new Corpse(dropLoc, 0);
    for (int i = 100; i >= 0; i--) {
      c.display();
      c.fall();
      if (c.bottom()) {
        c.reset();
      }
    }
  }
}

void mousePressed() {
  unlock = !unlock;
  title();
}