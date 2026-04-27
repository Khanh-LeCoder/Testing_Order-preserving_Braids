B = BraidGroup(4)

def free_semigroup_ball(radius,rank):
  if radius == 0:
    return [[]]
  else:
    ball = free_semigroup_ball(radius,rank)
    for word in free_semigroup_ball(radius,rank):      
        ball.extend([word.append(letter+1) for letter in list(range(rank))])
    return ball
    
  
