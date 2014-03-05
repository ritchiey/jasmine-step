
# Steps with no parameters

Step "I have a cat", ->
  @cats = 1
  
describe "Defining a simple step", ->
  When "I have a cat"
  Then -> expect(@cats).toEqual 1

Step "I should see a cat", ->
  expect(@cats).toEqual(1)

describe "specifying an expectation with a step", ->
  When "I have a cat"
  Then "I should see a cat"


# Steps with one parameter

Step "I have a dog called (.+)", (name) ->
  @dogName = name
  
describe "Using a step with one parameter", ->
  When "I have a dog called Bruce"
  Then -> expect(@dogName).toEqual('Bruce')
  
# Steps with multiple parameters

Step "(.+) has (\d+) cats?", (@name, @catQuantity) ->
  
describe "Using a step with multiple parameters", ->
  When "Glenys has 16 cats"
  Then -> expect(@name).toEqual('Glenys')
  Then -> expect(@catQuantity).toEqual '16'

Step "the cats? belongs? to (.+)", (name) ->
  expect(@name).toEqual(name)

Step "there are (\d+) cats", (quantity) ->
  expect(@catQuantity.toString()).toEqual quantity
  
describe "Using a step with multiple parameters variation", ->
  Given "Bruce has 2 cats"
  Then "the cats belongs to Bruce"
  And "there are 2 cats"

  

#describe "Referencing an undefined step", ->
#  Then "this step intentionally left undefined"
