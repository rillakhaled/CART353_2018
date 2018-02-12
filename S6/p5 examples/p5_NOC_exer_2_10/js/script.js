var movers;

function setup() {
  createCanvas(windowWidth,windowHeight);
  movers = [];

  for(var i = 0; i < 20; i++) {
    movers.push(new Mover(random(0.1,2),random(windowWidth),random(windowHeight)));
  }
}

function draw() {
    background(255);

    // for every mover i
    for(var i = 0; i < movers.length; i++) {

      // look at every other mover
      for(var j = 0; j < movers.length; j++) {

        if (i != j) {

          // work out the force the other mover is having on mover i
          var force = movers[j].attract(movers[i], -0.01);

          // apply that force to mover i
          movers[i].applyForce(force);
        }
      }

      // next, work out the force the mouse exerts on mover i
      var mouse = createVector(mouseX, mouseY);
      var mforce = movers[i].attractedToMouse(mouse, 1.5);

      // apply that force to mover i
      movers[i].applyForce(mforce);

      // finally, update and display mover i
      movers[i].update();
      movers[i].display();
    }
}

function windowResized() {
  resizeCanvas(windowWidth,windowHeight);
}
