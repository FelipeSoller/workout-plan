FactoryBot.define do
  factory :training do
    title { ['Treino de Segunda', 'Treino de Terça', 'Treino de Quarta', 'Treino de Quinta', 'Treino de Sexta', 'Treino de Sábado', 'Treino de Domingo'].sample }
    student
  end
end

