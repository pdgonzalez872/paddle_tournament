FactoryGirl.define do
  factory :tournament do
  end

  factory :draw do
    tournament
    size 32
  end

  factory :draw_position do
    draw
  end

  factory :player do
    draw_position
  end
end
