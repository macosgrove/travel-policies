class BuildQuote
  include Interactor::Organizer

  organize SanitiseParams, ValidateAge, CalculateQuote, CreateQuote
end
