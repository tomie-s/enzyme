=begin
You have 2 hashes. You are looking for the difference between the 2. What was added or removed or if the hash is the same.

Hash only have string keys
Hash only have string, boolean, number, array or hash as value
Compare should have an option for deep or shallow compare
Compare should list the difference for keys and values


Pseudocode
sort each hash so that it's alphabetical by key

iterate through the hash2 and for each key, find the same key in hash1 and compare the value of each key against each other

if hash2 has key that isn't in hash1 (or vice versa), add to blank hash
if hash2 has key that is in hash1 but the value is difference (or vice versa), add to blank hash

=end

def hash_compare(hash1, hash2)
  #alphabetical sorting would help with readability of result hash
  h1 = hash1.sort.to_h
  h2 = hash2.sort.to_h
  
  if h1 == h2
    return "there is no difference between the two hashes"
  else
    h2_diff = (h1.to_a - h2.to_a) #find any additions or deletions in h2
    h1_diff = (h2.to_a - h1.to_a) #find any additions or deletions in h1
    
    Hash[h2_diff | h1_diff] #create union of differences in h1 and h2
  end
end

#Test cases
#original hash
original = {
:'adam'=> 'havard',
:'ethan'=> {:eye => 'brown', :hair => 'black'},
:'bob'=> true,
:'dan'=> ['hiking', 'swiming', 'racing'],
:'caleb'=> 3
}

#test 1: for brand new key value pair not found in original hash
one = {
:'adam'=> 'havard',
:'ethan'=> {:eye => 'brown', :hair => 'black'},
:'bob'=> true,
:'dan'=> ['hiking', 'swiming', 'racing'],
:'caleb'=> 3,
:'frank'=> false,
}
#expected output = {frank: false}

#test 2: for both hash have the same keys but difference in value
two = {
:'adam'=> 'havard',
:'bob'=> true,
:'ethan'=> {:eye => 'blue', :hair => 'black'},
:'caleb'=> 3,
:'dan'=> ['hiking', 'swiming', 'racing'],
:'greg'=> 'oxford'
}
#expected output = {ethan: {eye: blue, hair: black}, greg: oxford}

#test 3: for when both has have the same key value pairs
three = {
:'adam'=> 'havard',  
:'dan'=> ['hiking', 'swiming', 'racing'],
:'ethan'=> {:eye => 'brown', :hair => 'black'},
:'bob'=> true,
:'caleb'=> 3
}
#expected output = there is no difference between the two hashes

#test 4: for when number of key value pair is less than original hash
four = {
:'adam'=> 'havard',  
:'dan'=> ['hiking', 'swiming', 'racing'],
:'bob'=> true,
:'ethan'=> {:eye => 'brown', :hair => 'black'}
}
#expected output = {caleb: 3}

puts hash_compare(original, four)
