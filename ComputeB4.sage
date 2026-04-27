def free_semigroup_sphere(radius,rank):
  if radius == 0:
    return [[]]
  else:
    previous_sphere = free_semigroup_sphere(radius-1,rank)
    for word in previous_sphere:
        sphere.extend([word + [letter + 1] for letter in range(rank)])
        return sphere

def free_semigroup_ball(radius,rank):
  ball = []
  for r in range(radius):
    ball.extend(free_semigroup_sphere(r+1,rank))
  return ball 

def braid_semigroup_ball(radius,strands):
  B = BraidGroup(strands)
  braid_ball = []
  element_set = set()
  for word in free_semigroup_ball(radius,strands-1):
    lnf = B(word).left_normal_form()
    if lnf not in element_set:     
      element_set.add(lnf)
      braid_ball.append(word)
  return braid_ball
  
  
