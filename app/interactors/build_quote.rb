# frozen_string_literal: true

class BuildQuote
  include Interactor::Organizer

  organize CreateQuote, ValidateTripDates, CalculateAge, ValidateAge, CalculateTripLength, CalculateQuote, SaveQuote
end
