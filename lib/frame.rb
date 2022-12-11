class Frame
  def initialize
    @score = 0
    @rolls = 0
    @status = :active
  end

  def add_roll(roll)
    raise "Can no longer add roll to this frame" if @status != :active
    raise ArgumentError.new "A roll must be an integer" unless integer_roll?(roll)
    raise ArgumentError.new "A roll must be between 0 and 10" if roll.negative? || roll > 10
    raise "Both rolls cannot add up to more than 10" if @score + roll > 10
    
    @score += roll.to_i
    @rolls += 1

    update_status
  end

  def score
    return @score
  end

  def status
    return @status
  end

  private

  def integer_roll?(roll)
    return roll.is_a?(Integer) || roll % 1 == 0
  end

  def update_status
    if @score == 10
      @status = :bonus if @score == 10
    elsif @rolls == 2
      @status = :done if @rolls == 2
    end
  end
end
