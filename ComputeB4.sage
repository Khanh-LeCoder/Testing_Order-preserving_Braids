def clear_denominators(laurent_poly_matrix):
	A = laurent_poly_matrix
	L.<t> = FunctionField(QQ)
	min_exp = min(e.polynomial_construction()[1] for e in A.list())
	B = (t**-min_exp) * A
	return B.change_ring(L)

def char_poly(laurent_poly_matrix):
	A = clear_denominators(laurent_poly_matrix)
	return A.characteristic_polynomial()

def lowest_deg_coeff(univar_rat_func):
	L.<t> = FunctionField(QQ)
	if univar_rat_func == 0:
		return 0
	else:
		min_deg = univar_rat_func.valuation('t')
		pole_removed = (univar_rat_func * t^(-min_deg)).element()
		return pole_removed(0)

def free_semigroup_sphere(radius,rank):
  if radius == 0:
    return [[]]
  else:
    previous_sphere = free_semigroup_sphere(radius-1,rank)
    new_sphere = []
    for word in previous_sphere:
        new_sphere.extend([word + [letter + 1] for letter in range(rank)])
    return new_sphere

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

count_pos = 0
count_neg = 0
word_length = 1
count = 0 
for word in braid_semigroup_ball(word_length,4):
  B = BraidGroup(4)
  braid = B(word)
  char = char_poly(braid.burau_matrix(var= 't',reduced =True))
  d = char.discriminant()
  ldc = lowest_deg_coeff(d)
  if ldc > 0 or ldc == 0:
    count_pos += 1
  else:
    count_neg += 1
  count += 1
  print("| ",count," | ",count_pos," | ",braid," | ",braid.thurston_type()," | ",char," | ",lowest_deg_coeff(d)," |")
print(count_pos,count_neg,count_pos + count_neg)
