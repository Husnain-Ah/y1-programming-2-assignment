// Programming 2 assignment

// This was made by Husnain Ahmed -- MMU Student ID : 21308666

// This is a siege game where the goal is to either avoid or kill all of your enemies, your character should be able to move on a horizontal plane and drop an object onto enemies that can move in a vertical plane as if they are climbing towards you

// The game class is the main class that runs the entire game

ArrayList<Enemies> EnemySet; // arraylist of enemies

ArrayList<Flamers> fireball; // arraylist of flamers (fireballs)

ArrayList<Bullet> boulders; // arraylist of bullets (boulders)

PImage background, splash, controls; // imports an image to be used as a background, splashscreen and instruction screen

Defender defender1; // loads one instance of the defender class (the character)

int score = 0; // initialises the score variable and sets it to 0

int GameMode = 2; // for the switch case statement that chooses gamemodes

PrintWriter HighScore; // this is for appending the score to a file

void setup()
{
  size(800, 800); // sets the screen size to 800 by 800 pixels

  HighScore = createWriter("HighScore.txt"); //creates a writer to write the score to a file

  background = loadImage("Wall.jpg"); // renders the background
  background.resize(width, height); //set image to be same size as the canvas

  splash = loadImage("GameOver.png"); // renders the splash screen
  splash.resize(width, height); //set image to be same size as the canvas

  controls = loadImage("Controls.png"); // renders the instruction screen
  controls.resize(width, height); //set image to be same size as the canvas


  defender1 = new Defender(400, 230, 10); // initialises the defender on top of the castle wall

  EnemySet = new ArrayList<Enemies>(); // initialises an enemy array
  boulders = new ArrayList<Bullet>(); // initialises a bullet array
  fireball = new ArrayList<Flamers>(); //initialises the array of fireballs

  for (int i = 0; i < 3; i++ ) // this for loop prints out 3 enemies 
  {
    float x = random(width);
    int x2 = int(x);

    EnemySet.add(new Enemies (x2, height, 2));
  }
}

void draw ()
{
  imageMode(CENTER); //draw image to fill the canvas

  switch(GameMode) 
  {
  case 0: 

    image(splash, width/2, height/2);

    HighScore.println(score + "\t"); // Writes the remaining data to the file
    HighScore.close(); // closes the file

    break;

  case 1: 

    image(background, width/2, height/2); //draw image to fill the canvas

    textSize(128); // setting the size of the text score counter
    text(score, 40, 120); // outputting the value of the score to the in-game score counter

    defender1.update(); // update the defender, this lets it run and loads it

    for (int i = boulders.size()-1; i >= 0; i--) //the for loop that drops a boulder and checks if it is collidiing with an enemy or not
    {
      Bullet ThrownBoulder = boulders.get(i);
      ThrownBoulder.update();

      for (int j = EnemySet.size() -1; j >= 0; j--)
      {
        float x = random(width);
        int x2 = int(x);

        Enemies enemy = EnemySet.get(j);

        if  (enemy != null && ThrownBoulder.crash(enemy)) // null check -- if the enemy is not null and the boulder is touching the enemy remove both of them and add 1 to the score, then add 1 new enemy to the bottom of the screen, when an ememy dies a fireball is spawned
        {
          EnemySet.remove(enemy);
          boulders.remove(ThrownBoulder);

          score++;
          print(score);

          fireball.add(new Flamers (x2, height, 6));

          EnemySet.add(new Enemies (x2, height, 2));
          break;
        }
      }
    } 

    for (Enemies enemy : EnemySet) //the enemy array
    {
      if (enemy != null) // if the enemy is not null ( if it is on the screen) the enemy will update
      {
        enemy.update();
        if (enemy.crash(defender1)) // if the enemy touches the defender XFXFDSXFDXG
        {
          defender1.death();

          delay(1000);

          GameMode = 0;
        }
      }
    }

    for (Flamers fire : fireball) //the flamer array
    {
      if (fire != null) // if the enemy is not null ( if it is on the screen) the enemy will update
      {
        fire.update();
        if (fire.crash(defender1)) // if the enemy touches the defender XFXFDSXFDXG
        {
          defender1.death();

          delay(1000);

          GameMode = 0; // calls the splashscreen / game over screen
        }
      }
    }

    break;

  case 2:

    image(controls, width/2, height/2);

    break;

  default:  // Default executes if the case is not set to any predetermined ones  

    GameMode = 2; // if any errors occur the game will start from the intended beginning

    break;
  }
}

void keyPressed() // the movement controls for the defender and the controls for shooting a bullet / boulder
{

  if (key == ' ') // starts the game when space is pressed
  {
    print(" space ");
    GameMode = 1;
  } else if (key == 'x') // starts / restarts the game when space is pressed
  {
    print(" X ");
    exit();
  }

  if (key==CODED)
  {
    if (keyCode==LEFT) // moves left
    {
      print(" left ");
      defender1.moveLeft();
    } else if (keyCode==RIGHT) // moves right
    {
      print(" right ");
      defender1.moveRight();
    } else if (keyCode ==DOWN) // drops the boulder when the down arrow key is presseed
    {
      print(" down ");
      boulders.add(new Bullet(defender1.x, defender1.y, 4));
    }
  }
}
