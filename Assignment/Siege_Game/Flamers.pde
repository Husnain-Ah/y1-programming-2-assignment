// this class is for the second enemy type that I will be reffering to as flamers, they will be balls of fire that cannot be killed and move very fast



private class Flamers extends Super
{
  //member variables

  PImage Flame1, Flame2; // importing 2 images to be used in the fireball animation for the flamer

  int counter = 0;// the counter and count dir are to be used for the animation sequence, they help switch between images
  int countDir= 1;


  //constructor
  Flamers(int x, int y, int dy)
  {
    super (x, y, dy);

    this.x = x; // position on screen
    this.y = y; // position on screen
    this.dy = dy; // vertical speed

    imageMode(CENTER);

    Flame1 = loadImage("Flame1.png"); // loading image from file
    Flame1.resize(40, 40); // resizing the image

    Flame2 = loadImage("Flame2.png");
    Flame2.resize(40, 40);
  }

  //methods

  void update() // runs the methods it contains
  {
    render();
    move();
  }

  void render() // renders the images and the animation for them
  {
    imageMode(CENTER);
    if (counter>=0 && counter<=5)
    {
      image(Flame1, x, y);
    } else if (counter>5 && counter<=15)
    {
      image(Flame2, x, y);
    } else 
    {
      countDir = -countDir; //reverse sequence
    }
    counter = counter + countDir;
  }

  void move() // moves up
  {
    y = y-dy;
    x = x - (int) random (-10, 10);
  }

  boolean crash(Defender other) // this detects if the flamer is in contact with the defender and returns a true value if it is
  {
    return (abs(this.x-other.x) < 20  &&  abs(this.y-other.y) < 20); // returns a boolean value if the distance between 2 objects is less than the size of the objects (if they are touching)
  }
} // end class
