class SpringVertex {
  float stiffness;
  float damping;
  PVector position;
  PVector target;
  PVector velocity;

  SpringVertex(PVector position) {
    this.stiffness = 0.8;
    this.damping = 0.8;
    this.position = position.copy();
    this.target = position.copy();
    this.velocity = new PVector();
  }
  
  void update() {
    PVector force = PVector.sub(target, position).mult(stiffness);
    velocity = PVector.add(velocity, force).mult(damping);
    position.add(velocity);
  }
  
  void drawVertex() {
    vertex(position.x, position.y);
  }
  
  void addVelocity(PVector velocity) {
    this.velocity.add(velocity);
  }
}