[And, Given, Step, Then, When] = do ->

  class SpecStep
    
    constructor: (@name, @fn) ->
    matches: (name) -> name.match(@name)
    
  steps = []
  Step = (name, fn) ->
    steps.push(new SpecStep(name, fn))
  
  
  wrap = (fn, passName) ->
    firstStepMatching = (stepName) ->
      return step for step in steps when step.matches(stepName) 
    
    specify = (stepName) ->
      step = firstStepMatching(stepName)
      if step?
        params = step.matches(stepName)[1..]
        return -> step.fn.apply(this, params)
  
    (arg) ->
      step = if typeof arg == "string" then specify.call this, arg else arg  
      if passName then fn(arg, step) else fn(step)
  
  [
    wrap(And)
    wrap(Given)
    Step
    wrap(Then, true)
    wrap(When)
  ]
