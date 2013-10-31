include "config.coffee"
include "Vect3.coffee"

log.debug("Type: #{params.card_type}, Sleeved: #{params.sleeved}: N: #{params.stack_size}")
log.level=log.DEBUG

x=0;y=1;z=2
showCards=params.show_cards
cardType=params.card_type
sleeved=params.sleeved

# Determine the dimensions of the actual cards in the stack
sleeveSize = new Vect3()
cardSize = new Vect3(57, 0.3, 89)

switch cardType
  when "Small"
    cardSize = new Vect3(41, 0.3, 63)
    if sleeved
      sleeveSize = new Vect3(47, 0.7, 71)

  when "Large"
    cardSize = new Vect3(57, 0.3, 89)
    if sleeved
      sleeveSize = new Vect3(65, 0.7, 90)


# Thickness of the walls of the stand
wt=1

# Gap to allow around the stack
gap=2

# How many cards are in the stack?
n=params.stack_size

# Size of the actual stack of cards
if sleeved
  stackSize = sleeveSize.multiply([1, n, 1])
else
  stackSize = cardSize.multiply([1, n, 1])

log.debug("Card size: #{cardSize.string()}")

# The main body of the box
boxSize = stackSize
boxSize = boxSize.subtract([0, 0, 10])
boxSize = boxSize.add([wt*2, wt*2, 0])
boxSize = boxSize.add([gap*2, gap*2, 0])
log.debug("Box size: #{boxSize.string()}")

formerSize = boxSize.subtract(wt+wt).add([0, 0, 3])
former = new Cube({size:formerSize.v()})
.translate([wt, wt, wt])

tf1 = new Cube({size: [boxSize.x()+(wt*2), boxSize.y()+(wt*2), 11]})
.translate([-wt, -wt, boxSize.z()-10])
.subtract(new Cube({size: boxSize.subtract([wt, wt, 0]).v()}).translate([wt*0.5, wt*0.5, 0]))
#assembly.add(tf1.color([1,0,0]))

box = new Cube({size:boxSize.v()})
.subtract(former)
.subtract(tf1)

lidSize = new Vect3(boxSize.x(), boxSize.y(), 20)

log.debug("Lid size: #{lidSize.string()}")

lidformerSize = lidSize.subtract(wt*2).add([0, 0, 3])
lidformer = new Cube({size:lidformerSize.v()})
.translate([wt, wt, wt])

lf2 = new Cube({size: lidformerSize.add(wt).v()})
.translate([wt/2, wt/2, lidformerSize.z()-10])
#assembly.add(lf2.color([1,0,0]).translate([0, -lidSize.y()-10, 0]))

lid = new Cube({size:lidSize.v()})
.subtract(lidformer)
.subtract(lf2)


assembly.add(box)
assembly.add(lid.translate([0, -lidSize.y()-10, 0]))

if showCards
  cards = new Cube({size: stackSize.v()})
  .color([0.6, 0, 0, 0.8])
  .translate([wt+gap, wt+gap, wt])
  assembly.add(cards)