module Colors
  extend self

  VALID_COLORS = ('A'..'Z').to_a.freeze
  WHITE = 'O'.freeze

  def valid?(color)
    VALID_COLORS.include?(color)
  end
end
