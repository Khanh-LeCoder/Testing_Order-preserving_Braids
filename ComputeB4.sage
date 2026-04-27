B = BraidGroup(4)

def free_semigroup_ball(radius,rank):
  if radius == 0:
    return [[]]
  else:
    ball = free_semigroup_ball(radius,rank)
    for word in ball:      
        sphere = [word.append(letter+1) for letter in range(rank)]
    return ball.extend(sphere)

free_semigroup_ball(2,1)
  
