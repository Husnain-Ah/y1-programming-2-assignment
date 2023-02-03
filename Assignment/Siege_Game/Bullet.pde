// the bullet class contains the boulder that drops from the player onto enemies

class Bullet
{
  //member variables
  float x, y; // position on screen
  float dy; // vertical speed

  PImage boulder; // importing an image to be used for the bullet


  //constructor
  Bullet(float x, float y, float dy)
  {
    this.x = x;
    this.y = y;
    this.dy = dy;

    imageMode(CENTER);

    boulder = loadImage("Rock.png"); // loading image from file
    boulder.resize(50, 50); // resizing the image
  }

  //methods

  void update() // runs all of the procedures that are inside it when called
  {
    render();
    move();
  }

  void render()   //renders the image used for the bullet
  {
    image(boulder, this.x, this.y);
  }

  void move() // moves down after fired
  {
    this.y = this.y+this.dy;
  }


  boolean crash(Enemies other) // this detects if the boulder is touching any enemies
  {
    return (abs(this.x-other.x) < 50  &&  abs(this.y-other.y) < 50); // returns a boolean value if the distance between 2 objects is less than the size of the objects (if they are touching)
  }
} // end of class
