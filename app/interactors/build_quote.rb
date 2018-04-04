# frozen_string_literal: true

class BuildQuote
  include Interactor::Organizer

  organize CreateQuote, ValidateAge, CalculateQuote, SaveQuote
end
