class SpringShape {
  PVector center;
  SpringVertex[] vertices;
  color fillColor = color(0, 0, 0, 0);
  color strokeColor = color(255);

  SpringShape(PVector[] vertices) {
    this.center = new PVector();
    this.vertices = new SpringVertex[vertices.length];
    for (int i = 0; i < vertices.length; i++) {
      this.vertices[i] = new SpringVertex(vertices[i]);
    }
  }

  void update() {
    for (SpringVertex vertex : vertices) {
      vertex.update();
    }
  }

  void draw() {
    pushMatrix();
    translate(center.x, center.y);
    fill(fillColor);
    stroke(strokeColor);
    beginShape();
    for (SpringVertex vertex : vertices) {
      vertex.drawVertex();
    }
    endShape();
    popMatrix();
  }
  
  void setCenter(PVector center) {
    this.center = center.copy();
  }
  
  void addVelocity(int i, PVector velocity) {
    vertices[i].addVelocity(velocity.copy());
  }
  
  int getVerticesLength() {
    return vertices.length;
  }
}