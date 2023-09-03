class JuiceMaker
  @running : Bool = false
  @fluid : Int32

  def self.debug_light_on?
    true
  end

  def initialize(@fluid)
  end

  def start
    @running = true
  end

  def running?
    @running
  end

  def add_fluid(amount)
    @fluid += amount
  end

  def stop(running_minutes)
    @running = false

    fluid_cost_per_minute = 5
    @fluid -= running_minutes * fluid_cost_per_minute
  end
end
