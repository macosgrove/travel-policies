# frozen_string_literal: true

class BuildQuote
  include Interactor::Organizer

  organize CreateQuote, SanitiseParams, ValidateAge, CalculateQuote, SaveQuote
end
