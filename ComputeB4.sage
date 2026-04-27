B = BraidGroup(4)

def free_semigroup_sphere(radius,rank):
  if radius == 0:
    return [[]]
  else:
    previous_sphere = free_semigroup_sphere(radius-1,rank)
    for word in previous_sphere:
        sphere = [word + [letter + 1] for letter in range(rank)]
        return sphere

def free_semigroup_ball(radius,rank):
  ball = []
  for r in range(radius):
    ball.extend(free_semigroup_sphere(r+1,rank))
  return ball 


  
