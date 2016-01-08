boolean unlock = false;
float dropLoc;
PImage oscar;
PVector mouse;

ArrayList<Corpse> c = new ArrayList<Corpse>();
Catcher chosenUndead;

void setup() {
  size(1400, 800);
  chosenUndead = new Catcher();
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


    chosenUndead.display();

    c.add(new Corpse(dropLoc, 0));
    for (int i = c.size() -1; i >= 0; i--) {
      Corpse deadBody = c.get(i);
      deadBody.display();
      deadBody.fall();
      if (deadBody.bottom()) {
        println("remove the corpse in frame " + frameCount);
        c.remove(i);
      }
      deadBody.scoreCalc();
      deadBody.scoring();
    }
  }
}

void mousePressed() {
  unlock = !unlock;
  title();
}