// the Enemies class is the enemies that the player has to avoid or kill to win the game

private class Enemies extends Super
{
  //member variables


  PImage Climb1, Climb2; // importing 2 images to be used in the climbing animation for the enemies

  int counter = 0;// the counter and count dir are to be used for the animation sequence, they help switch between images
  int countDir= 1;


  //constructor
  Enemies(int x, int y, int dy)
  {
    super (x, y, dy);

    this.x = x; // position on screen
    this.y = y; // position on screen
    this.dy = dy; // vertical speed

    imageMode(CENTER);

    Climb1 = loadImage("Climb1.png"); // loading image from file
    Climb1.resize(35, 70); // resizing the image

    Climb2 = loadImage("Climb2.png");
    Climb2.resize(35, 70);
  }

  //methods

  void update() // runs the methods it contains
  {
    render();
    move();
    reset();
  }

  void render() // renders the images and the animation for them
  {
    imageMode(CENTER);
    if (counter>=0 && counter<=5)
    {
      image(Climb1, x, y);
    } else if (counter>5 && counter<=15)
    {
      image(Climb2, x, y);
    } else 
    {
      countDir = -countDir; //reverse sequence
    }
    counter = counter + countDir;
  }

  void move() // moves up
  {
    y = y-dy;
  }

  void reset() //reset the y position of the attacker to bottom of screen if they climb off of the screen as well as set their x position to a random value to give the illusion of a new enemy appearing
  {
    float u = random(width);
    int x2 = int(u);

    if (this.y <= 0)
    {
      this.y = height;
      this.x = x2;
    }
  }


  boolean crash(Defender other) // this detects if the enemy is in contact with the defender and returns a true value if it is
  {
    return (abs(this.x-other.x) < 35  &&  abs(this.y-other.y) < 35); // returns a boolean value if the distance between 2 objects is less than the size of the objects (if they are touching)
  }
} // end class
