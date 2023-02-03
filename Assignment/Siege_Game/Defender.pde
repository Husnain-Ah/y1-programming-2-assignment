// the defender class is the knight that can be controlled by the player

private class Defender extends Super
{
  //member variables

  PImage KnightStill, KnightLeft, KnightRight, Death; // importing 4 images to be used in the turning animation for the defender and the death animation

  //constructor
  Defender(int x, int y, int dy)
  {
    super (x, y, dy);
    this.x = x; // position on screen
    this.y = y; // position on screen
    this.dy = dy; // horizontal speed


    imageMode(CENTER);

    KnightStill = loadImage("KnightStill.png"); // loading image from file
    KnightStill.resize(75, 75); // resizing the image

    KnightLeft = loadImage("KnightLeft.png");
    KnightLeft.resize(75, 75);

    KnightRight = loadImage("KnightRight.png");
    KnightRight.resize(75, 75);

    Death = loadImage("Death.png"); // renders the skul image
    Death.resize(100, 100); //resizes skull
  }

  //methods

  void update() // runs all of the procedures that are inside it when called
  {
    render();
    wall();
  }

  void render()   // this loads the image fo the knight standing still
  {
    image(KnightStill, this.x, this.y);
  }

  void moveLeft() // the move procedures are for the controls that move the defenders  by 10 pixels in the direction of the arrow key that the player presses on (left or right)
  {
    image(KnightLeft, this.x, this.y);
    x = x-dy;
    //y = y - (int) random (-3, 3);
  }

  void moveRight()
  {
    image(KnightRight, this.x, this.y);
    x = x+dy;
    //y = y - (int) random (-3, 3);
  }

  void wall() // this detects if the defender is in contact with a wall and moves it back by 10 pixels if it is
  {
    if (this.x > width - 60 )
    {
      x = x-10;
    }
    if ( this.x < 55)
    {
      x=x+10;
    }
  }

  void death()
  {
    image(Death, defender1.x, defender1.y);
  }
} // end class
