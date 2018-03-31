class BuildQuote
  include Interactor::Organizer

  organize SanitiseParams, CalculateQuote, CreateQuote
end
