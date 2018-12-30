# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    title { 'Projeto Lava Jato' }
    description do
      'Gostaria de seu comentário e sua' \
      'aprovação para a próxima fase de nosso projeto.'
    end
    recipient { 'sac@senado.gov.br' }
    status { 'pending' }
    user
    attach { File.new("#{Rails.root}/spec/support/fixtures/image.jpg") }
  end
end
