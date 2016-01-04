boolean unlock = false;

PImage oscar;
PVector mouse;

ArrayList<Corpse> c = new ArrayList<Corpse>();
Catcher chosenUndead;

void setup() {
  size(1400, 800);
  title();
  frameRate(30);

  imageMode(CENTER);
  oscar = loadImage("19912_dark_souls_black.jpg");

  mouse = new PVector();
  c.add(new Corpse(mouseX, mouseY));
}

void draw() {
  if (!unlock) {
    title();
  }

  if (unlock) {
    background(0);

    image(oscar, mouseX, oscar.height/8, oscar.width/4, oscar.height/4);
    chosenUndead = new Catcher();
  }
}

void mousePressed() {
  unlock = !unlock;
  title();
}