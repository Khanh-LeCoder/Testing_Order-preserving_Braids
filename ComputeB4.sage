B = BraidGroup(4)

def free_semigroup_ball(radius,rank):
  if radius == 0:
    return [[]]
  else:
    ball = free_semigroup_ball(radius-1,rank)
    for word in ball:      
        sphere = [word.append(letter+1) for letter in range(rank)]
    return ball + sphere

free_semigroup_ball(1,1)
free_semigroup_ball(2,1)
  
