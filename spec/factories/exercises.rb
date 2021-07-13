FactoryBot.define do
  factory :exercise do
    name { Faker::Lorem.word }
    sets { 3 }
    reps { 12 }
    rest { 60 }
    muscle_group { ['Abdominal', 'Bíceps', 'Deltóide', 'Dorsal', 'Gêmeos', 'Gluteo', 'Isquiotibial', 'Oblíquos', 'Peitoral', 'Quadríceps', 'Trapézio','Tríceps'].sample }
    training
  end
end