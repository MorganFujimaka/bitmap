class Colors
  ('A'..'Z').each { |color| const_set(color, color) }
end
