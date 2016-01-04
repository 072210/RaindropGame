boolean unlock = false;
PVector mouse;
ArrayList<Corpse> c = new ArrayList<>();
Catcher chosenUndead;

void setup() {
  size(1400, 800);
  //title screen function
  mouse = new PVector();
  c.add(new Corpse(mouseX, mouseY));
}

void draw() {
  if (unlock) {
  } else {
  }
}

void mousePressed() {
  unlock = !unlock;
}