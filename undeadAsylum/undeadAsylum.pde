//game moving? yes
boolean unlock = true;
//declare variables
float dropLoc, score;
//declare Oscar of Astora
PImage oscar;
//declare mouse vector
PVector mouse;

//create an ArrayList to hold corpses
ArrayList<Corpse> c = new ArrayList<Corpse>();
//create a catcher called chosenUndead
Catcher chosenUndead;

//let's set up the void one last time
void setup() {
  //set canvas size to 1400 x 800
  size(1400, 800);
  //hide the cursor so you won't be distracted from Solaire's magnificence
  noCursor();
  //make the game sloooow
  frameRate(10);

  //initialise score at zero
  score = 0;

  //image reference point is at center
  imageMode(CENTER);
  //initialise Oscar of Astora from data folder
  oscar = loadImage("19912_dark_souls_black.jpg");

  //set the text's reference point to its center
  textAlign(CENTER);
  //set the text size to 20
  textSize(20);

  //initialise mouse
  mouse = new PVector();
  //add a new corpse to the array
  c.add(new Corpse(mouseX, mouseY));
  //create a new catcher called chosenUndead
  chosenUndead = new Catcher();
}

//it is time to descend into the Abyss
void draw() {
  //this is where Humanity will spawn: from Oscar's head
  dropLoc = random(width);

  //ending screen if game is not running
  if (!unlock) {
    //call title function
    title();
  }

  //if game is running, then run the game
  if (unlock) {
    //set background to black
    background(0);
    //set the mouse vector to where the mouse is
    mouse.set(mouseX, mouseY);

    //draw Oscar of Astora randomly at the top
    image(oscar, dropLoc, oscar.height/8, oscar.width/4, oscar.height/4);

    //draw Solaire of Astora according to display()
    chosenUndead.display();

    //add a corpse to the ArrayList
    c.add(new Corpse(dropLoc, 0));
    //for loop
    for (int i = c.size() - 1; i >= 0; i--) {
      //create corpse called deadBody, which is definitely not my fault
      Corpse deadBody = c.get(i);
      //display the deadBody (it's Humanity, for our sake)
      deadBody.display();
      //have the Humanity fall like rain
      deadBody.fall();

      //if the Humanity reaches the ground or touches Solaire
      if (deadBody.bottom() || deadBody.contact()) {
        //then tell us when it was removed and
        println("remove the humanity from frame " + frameCount);
        //do remove it, thank you
        c.remove(i);
      }

      //if the Humanity touches Solaire
      if (deadBody.contact()) {
        //then increase the score
        score += 1;
      }

      //if said score reaches 99, or max Humanity
      if (score >= 99) {
        //then end the game
        unlock = !unlock;
      }
    }

    //display the score below
    println("humanity restored; up to " + score);
    //display the score in the middle of the game screen
    text(score + " / 99 Humanity", width/2, height/2);
  }
}

//if the mouse is clicked, but ONLY during the game's end, then reset its counter
//this prevents prematurely ending the game from clicking during gameplay
void mousePressed() {
  if (!unlock) {
    unlock = !unlock;
    score = 0;
  }
}