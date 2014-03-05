/* jasmine-given-steps - 0.0.1
 * Descriptive steps for Jasmine-Given
 * https://github.com/ritchiey/jasmine-given-steps
 */
(function() {
  var And, Given, Step, Then, When, _ref;

  _ref = (function() {
    var SpecStep, Step, steps, wrap;
    SpecStep = (function() {
      function SpecStep(name, fn) {
        this.name = name;
        this.fn = fn;
      }

      SpecStep.prototype.matches = function(name) {
        return name.match(this.name);
      };

      return SpecStep;

    })();
    steps = [];
    Step = function(name, fn) {
      return steps.push(new SpecStep(name, fn));
    };
    wrap = function(fn, passName) {
      var firstStepMatching, specify;
      firstStepMatching = function(stepName) {
        var step, _i, _len;
        for (_i = 0, _len = steps.length; _i < _len; _i++) {
          step = steps[_i];
          if (step.matches(stepName)) {
            return step;
          }
        }
      };
      specify = function(stepName) {
        var params, step;
        step = firstStepMatching(stepName);
        if (step != null) {
          params = step.matches(stepName).slice(1);
          return function() {
            return step.fn.apply(this, params);
          };
        }
      };
      return function(arg) {
        var step;
        step = typeof arg === "string" ? specify.call(this, arg) : arg;
        if (passName) {
          return fn(arg, step);
        } else {
          return fn(step);
        }
      };
    };
    return [wrap(And), wrap(Given), Step, wrap(Then, true), wrap(When)];
  })(), And = _ref[0], Given = _ref[1], Step = _ref[2], Then = _ref[3], When = _ref[4];

}).call(this);
