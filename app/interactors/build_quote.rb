# frozen_string_literal: true

class BuildQuote
  include Interactor::Organizer

  organize CreateQuote, CalculateAge, ValidateAge, CalculateTripLength, CalculateQuote, SaveQuote
end
