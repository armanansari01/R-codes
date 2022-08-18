#factorization is used only to categorize the data

#syntax  factor(x=character(),levels,labels=levels,ordered = is.ordered(x))

#create gender vector
gender_vec <- c("Male","Female","Female","Male","Male")
class(gender_vec)
gender_vec
#convert gender_vec to a factor
factor_gen_vec = factor(gender_vec)
class(factor_gen_vec)
factor_gen_vec

